---
layout: layouts/base.njk
title: How to Create a Static Website (on AWS)
---
# {{ title }}

## Register for AWS

Sign up for [Amazon Web Services][] (AWS).

### Create an Admin account

AWS also strongly recommends creating a separate [AWS Administrator account][] for added security. This account will be used to create your site.

>  **Make sure to download the CSV containing your login credentials and access/secret keys at the tail end of the process. And store them in a secure place!!**

## Create an S3 bucket

In this step we'll create an AWS [Simple Storage Service][] (S3) bucket to host the HTML and other files used by our static site.

* Grab the console login link from the CSV you downloaded when creating the administrator account.
* Log into AWS using your Administrator account credentials.
* Locate and navigate to the S3 service.
* [Create an S3 bucket][] to store your site in the **US East (N. Virginia) region**. The bucket must have a unique name that has not already been created by another AWS user. For now, accept the default settings. This will create a private bucket that noone can view. In a subsequent step, we'll update the bucket's settings to serve as a public website.

## Enable website hosting

> See the [Configuring a bucket for website hosting](https://docs.aws.amazon.com/AmazonS3/latest/dev/HowDoIWebsiteConfiguration.html) docs for more detail below.

* [Enable website hosting][] for the bucket and enter the default index and error pages.
* Next, update the [bucket permissions](https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteAccessPermissionsReqd.html) to enable public readability of files.
  * Navigate to `Permissions -> Bucket Policy`
  * Add a policy such as below (*replace `example.com` below with your own bucket name in the `Resource` section*):
    ```
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "PublicReadGetObject",
                "Effect": "Allow",
                "Principal": "*",
                "Action": "s3:GetObject",
                "Resource": "arn:aws:s3:::example.com/*"
            }
        ]
    }   

    ```
* Upload a test HTML page to the site called `index.html`.
* Check the public URL of the page to verify the content is accessible. The URL should follow the below format:
    ```
    # Format
    http://<bucket-name>.s3-website.<region>.amazonaws.com
    
    # Example
    http://example.com.s3-website.us-east-1.amazonaws.com/
    ```
> See the [website endpoints][] documentation for more details on how to access your public site.

### Clean URLs

This type of setup has the added benefit of clean URLs -- i.e. the ability to use URLs
that end in a `/` -- when using `index.html` pages inside a given URL path. 

For example, `http://example-bucket.s3-website-us-east-1.amazonaws.com/somepath/` will automatically display the `index.html` inside of the `somepath/` directory in your bucket.

[website endpoints]: https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteEndpoints.html

## Add a custom domain and HTTPS

Adding a custom domain with HTTPS to your site is a bit more involved but lends some professionalism to your site and hopefully inspires trust among viewers. It's also a good idea since Chrome (and possibly other browsers) have started to warn users about non-secure HTTP sites.

The good news is that AWS provides a number of services that can simplify the overall
process, including the ability to purchase a domain and obtain a free SSL certificate.

### Use a custom domain for your site

Use Route 53 to purchase a domain (this makes many things easier downstream).

### Set up SSL for your domain

* Use AWS Certificate Manager to [request a public SSL certificate](https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html) for your domain.
* As part of this process, you must validate the certificate by proving that you own the associated domain. This process is especially easy if you purchased a domain through Route 53 (as mentioned above). When validating, use the [DNS validation method](https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-dns.html),
which simplifies the process of setting up DNS records for validating domains purchased through Route 53.

### Set up HTTPS to your bucket

The final few steps involve using AWS Route 53 and CloudFront to route viewers of your custom domain to the S3 bucket you set up at the beginning of this process.

This involves:

* Setting up a CloudFront "distribution", which routes traffic to your S3 bucket.
* Updating Route 53 DNS settings to point your custom domain to an (intermediate) domain provided by CloudFront.

The overall architecture sounds a bit complicated, but it boils down to this:

```
User -> mydomain.com (Route53) -> CloudFront domain -> S3
```

### Create a CloudFront Distribution

Follow these steps to [set up a distribution][] to serve HTTPS requests for the S3 bucket.

When setting up a CloudFront distribution, you will get dropdown menus that let you  select the domain created by Route 53 and the associated SSL certificate created via AWS Certificate Manager. 

Some important notes about the setup process:

* Set the `Origin Domain` value to the bucket's *website domain*, rather than the standard S3 bucket domain. This will allow you to ensure that the "clean URL" behavior for `index.html` files works. For example:
 ```
 # Do this
 example.com.s3-website-us-east-1.amazonaws.com/

 # NOT this
 s3.amazonaws.com/example.com/index.html
 ```
* After you've created the distribution, you must still go to Route 53 and create an [Alias][] record that routes traffic from your purchased domain to the CloudFront domain you just created. This last step is noted without much emphasis 
in the [set up a distribution][] docs.

### Create Route 53 Alias

For this final step, you must create an [Alias][] DNS record in Route 53 that points
all traffic from your domain to the CloudFront-generated domain.


[Alias]: https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-values-alias.html
[Amazon Web Services]: https://aws.amazon.com/
[AWS Administrator account]: https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/setting-up-cloudfront.html
[Create an S3 bucket]: https://docs.aws.amazon.com/AmazonS3/latest/user-guide/create-bucket.html
[Enable website hosting]: https://docs.aws.amazon.com/AmazonS3/latest/dev/EnableWebsiteHosting.html
[Simple Storage Service]: https://aws.amazon.com/s3/
[set up a distribution]: https://aws.amazon.com/premiumsupport/knowledge-center/cloudfront-https-requests-s3/#