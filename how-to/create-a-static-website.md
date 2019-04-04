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
* Navigate to the S3 service.
* [Create an S3 bucket][] to store your site in the **US East (N. Virginia) region**. The bucket must have a unique name that has not already been created by another AWS user. For now, accept the default settings. 

You should now have a private bucket that noone can view. You can test this by uploading a file and then trying to access it using the "Object URL" (this can be retrieved from the `Overview` tab after clicking on an uploaded file in the S3 console).

In the next step, we'll update the bucket's settings to serve as a public website.

## Enable website hosting

Now that we have a bucket, it's time to enable it for website hosting. What follows is a distilled version of the process. See [Configuring a bucket for website hosting](https://docs.aws.amazon.com/AmazonS3/latest/dev/HowDoIWebsiteConfiguration.html) for more details.

* [Enable website hosting][] for the bucket and enter the default names for the index and error pages.
* Next, update the [bucket permissions](https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteAccessPermissionsReqd.html) to enable public readability of files. This is a multi-step process:
  * Navigate to `Permissions -> Public access settings`
  * Click `Edit` in the right corner and uncheck the two boxes at bottom ("Block new public bucket policies" and "Block public and cross-account access...")
  * Click `Save`
  * Next, navigate to `Permissions -> Bucket Policy`
  * Add the below [bucket policy][], *replacing `example.com` with your own bucket name in the `Resource` section*. You must use the precise bucket name (e.g. don't include ".com" if your bucket doesn't have ".com" in the name) and make sure to keep the trailing `/*` at the end.
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
* Use the S3 web console for your bucket to upload a test HTML page called `index.html`:
  ```
    <!DOCTYPE html>
    <html>
        <body>
            <h1>Hello world!</h1>
            <p>Future home of an awesome project website.</p>

        </body>
    </html>
  ```
* Check the public URL of the page to verify the content is accessible. This can be found by going back to where you configured static website hosting and grabbing the `Endpoint` link. The URL should follow the below format:
    ```
    # Format
    http://<bucket-name>.s3-website.<region>.amazonaws.com/
    
    # Example
    http://example.com.s3-website.us-east-1.amazonaws.com/

   ```
> See the [website endpoints][] documentation for more details on how to access your public site.

[bucket policy]: https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-overview.html#access-control-resources-manage-permissions-basics
[website endpoints]: https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteEndpoints.html

### Clean URLs

This type of setup has the added benefit of clean URLs -- i.e. the ability to use URLs
that end in a `/` -- when using `index.html` pages inside an S3 directory. 

For example, `http://example-bucket.s3-website-us-east-1.amazonaws.com/somepath/` will automatically display the `index.html` inside of the `somepath/` directory in your bucket.

### En fin

Congratulations! You now have a static S3 website. Next, we'll [add a custom domain and HTTPS][] to lend some polish to the site.

[add a custom domain and HTTPS]: https://data-driven.news/how-to/add-custom-domain-and-https/


[Amazon Web Services]: https://aws.amazon.com/
[AWS Administrator account]: https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/setting-up-cloudfront.html#setting-up-create-iam-user
[Create an S3 bucket]: https://docs.aws.amazon.com/AmazonS3/latest/user-guide/create-bucket.html
[Enable website hosting]: https://docs.aws.amazon.com/AmazonS3/latest/dev/EnableWebsiteHosting.html
[Simple Storage Service]: https://aws.amazon.com/s3/