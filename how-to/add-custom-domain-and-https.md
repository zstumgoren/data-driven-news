---
layout: layouts/base.njk
title: Add a Custom Domain and HTTPS to Your Website
---
# {{ title }}

## Overview

> Note: This tutorial assumes you've already completed the steps in [Create a Static Website][].

Adding a custom domain and [HTTPS][] to your [AWS website][] can lend some polish and professionalism. It's also a good idea since Google Chrome (and possibly other browsers) have started to warn users about non-secure HTTP sites.

In addition to [S3][], there are a few key AWS services we'll need to wire up this type of architecture:

* [Certificate Manager][] to create an [SSL certificate][] (which provides the "S" in HTTPS)
* [CloudFront][], a [content delivery network][] that is capable of routing SSL traffic to an S3 bucket set up as a website 
* [Route 53][] to purchase a custom domain name and route traffic to CloudFront (which in turn routes to our S3 bucket)

The overall architecture sounds a bit complicated, but it boils down to this:

```
User -> mydomain.com (Route53) -> CloudFront domain -> S3
```

And the good news is that because we're using AWS, the overall process is dramatically simpler than a more traditional strategy that involves separately purchasing a domain and (pricey) SSL certificate, setting up a web server, and configuring [DNS][].

[HTTPS]: https://en.wikipedia.org/wiki/HTTPS
[AWS website]: https://data-driven.news/how-to/create-a-static-website/
[S3]: https://aws.amazon.com/s3/
[Create a Static Website]: https://data-driven.news/how-to/create-a-static-website/
[Certificate Manager]: https://aws.amazon.com/certificate-manager/
[SSL certificate]: https://en.wikipedia.org/wiki/Public_key_certificate
[CloudFront]: https://aws.amazon.com/cloudfront/
[content delivery network]: https://en.wikipedia.org/wiki/Content_delivery_network
[Route 53]: https://aws.amazon.com/route53/
[DNS]: https://en.wikipedia.org/wiki/Domain_Name_System

## Get a custom domain

* Sign into the AWS console using the Administrator account you set up in the [Create a Static Website][] tutorial.
* Go to [Route 53][] and [purchase/register a domain][]. Steer clear of `.io` domains to avoid [headaches](https://docs.aws.amazon.com/acm/latest/userguide/troubleshoot-iodomains.html).

> You don't necessarily have to purchase a domain through Route 53, but it dramatically simplifies donwstsream DNS configuration.

[purchase/register a domain]: https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-register.html

## Acquire an SSL certificate for your domain

Go to the AWS [Certificate Manager][] service to [request a public SSL certificate][] for your domain.

> Below, we use *example.com* to demonstrate the workflow. During this process, you must substitute the domain name you purchased in the prior step of the tutorial (e.g. data-driven.news).

* Make sure that the *U.S. East (N. Virginia)* region is selected in the upper-right corner of the page.
* Click `Request a certificate`
* Leave the default selection (`Request a public certificate`) and click `Request a certificate`
* In the `Add domain names` section, you'll want to add 3 variations of the domain name you just purchased. Here is a sample that you should modify for your own domain: 
  * `example.com`
  * `www.example.com`
  * `*.example.com`
* Click `Next`
* For `Select Validation Method`, leave the [DNS validation][] method selected and click `Review`
* If everything looks good, click `Confirm and Request`

On the next screen in Certificate Manager, you should see that the request is in progress. This process can take a while (about 20-30 minutes). Before leaving this page:

* Click on each entry listed in the Domain box
* Click `Create record in Route 53` and then `Create` in the pop-up box

> Again, you should do this 3 times - once for each CNAME record.

Now click `Continue`. You'll likely see that the Status of the certificate is "Pending validation". This process can take a few minutes and is only complete when the certificate has a status of "Issued". *You must wait until this process is complete before proceeding to the next stage*, where we'll set up the CloudFront Distribution.

[request a public SSL certificate]: https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html
[DNS validation]: https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-dns.html

## Set up HTTPS

The final few steps involve using AWS [Route 53][] and [CloudFront][] to route viewers of your custom domain to the S3 bucket you set up at the beginning of this process.

This involves:

* Setting up a CloudFront "distribution", which routes traffic to your S3 bucket.
* Updating Route 53 DNS settings to point your custom domain to an (intermediate) domain provided by CloudFront.

## Create a CloudFront Distribution

In this step, we'll set up a [CloudFront][] distribution that can serve HTTPS requests for the S3 bucket.

### Pre-flight check

> Before beginning this step, please verify that the SSL certificate you requested in the last step has a `Status` of "Issued".

In order to create a distribution, we'll need to grab the S3 *website endpoint* for our bucket. To retrieve this URL:

* Go to the S3 console
* Click into your bucket
* Click `Properties`
* Click `Static website hosting`
* Copy the url afer `Endpoint` at the top of the box, e.g. `http://comm177t-2019-stumgoren.s3-website-us-east-1.amazonaws.com`

### Create the distribution

With the S3 website URL in hand, we're ready to create the distribution in CloudFront.

* Go to the CloudFront console
* Click `Create a distribution`
* On the `Select a delivery method for your content` page, click `Get Started` under the top "Web" section.

You should now see a data entry form for the distribution, which you should fill out as follows:

* Paste the S3 website endpoint URL into the `Origin Domain Name` field (don't include the `http://` portion of the URL)
* Hit `tab`. This should autofill the `Origin ID` field (which requires a value)
* Go to `Distribution Settings` a little farther down in the form and configure as follows:
  * `Price Class`: Use Only U.S., Canada and Europe
  * `Alternate Domain Names (CNAMES)`: Use the same values you entered in the previous step when creating the SSL certificate (e.g. `example.com`, `*.example.com`, `www.example.com`)
* `SSL Certificate`
  * Select `Custom SSL Certificate`
  * Click into the empty field and select the SSL certificate you created earlier. If the certificate does not appear in the drop-down menu, please verify in [Certificate Manager][] that the `Status` is "Issued".
* Click `Create Distribution` at lower right of page.

Once again, this process can take up to 20-30 minutes. You can view the progress by clicking on `Distributions` in the upper left corner of the CloudFront console, and checking the `Status` column. When the `In Progress` indicator has changed to `Deployed`, you can hop over to Route 53 for the final step in the process.

> See [these steps][] for more background on the above.

Before heading to Route 53, be sure to grab the unique domain name generated by CloudFront. This can be retrieved by:

* Navigating to the CloudFront console
* Clicking `Distributions` in the upper left corner of the page
* Copying the value under the `Domain Name` column for your new distribution

Stash this domain away. You'll need it in the next step.

## Create Route 53 Alias

For this final step, you must create a DNS [Alias][] record in Route 53 that points all traffic from your domain to the CloudFront-generated domain. 

* Navigate to [Route 53][] in the AWS console
* Click on `Registered domains` in the left navigation
* Click on the name of your domain
* Click `Manage DNS`. This will take you to the "Hosted Zones" area
* Click on the Hosted Zone entry for your domain (this Hosted Zone should have automatically been created when you first registered the domain)
* Click `Create Record Set`. A data entry form should appear in the right panel.
* Fill in the form as follows:
  * **Type** - "A - IPv4 Address"
  * **Alias** - Yes
  * **Alias target** - Provide the domain created by CloudFront, e.g. `d28y8kg5ghli2n.cloudfront.net` (see the CloudFront instructions above on how to retrieve this value) 
* Leave the other values in their default settings and click `Save Record Set`

You should now be able to visit your new site (e.g. https://example.com). We have not set up a `CNAME` record for the other aliases we requested, so https://www.example.com (with the `www` subdomain) will *not* yet work.

## Summary

If all these steps went smoothly, you should have a shiny new domain that serves your S3-hosted website over HTTPS. This should lend a degree of professionalism to your new site.

However, it's important to note that this type of architecture is not secure end-to-end. With the current setup, only the traffic between a user's browser and the CloudFront domain is encrypted. Communications inside the Amazon network between CloudFront and S3 continue to be performed over unsecured HTTP.

This type of setup may not be appropriate for hosting sensitive files/information. But for a basic project site, we've chosen to make this trade-off on security to gain simplicity in setup and management of our static website.

[Alias]: https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-values-alias.html
[Amazon Web Services]: https://aws.amazon.com/
[AWS Administrator account]: https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/setting-up-cloudfront.html
[Simple Storage Service]: https://aws.amazon.com/s3/
[set up a distribution]: https://aws.amazon.com/premiumsupport/knowledge-center/cloudfront-https-requests-s3/#
[these steps]: https://aws.amazon.com/premiumsupport/knowledge-center/cloudfront-https-requests-s3/#
