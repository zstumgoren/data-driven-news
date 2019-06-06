---
layout: layouts/base.njk
title: Setting up AWS CLI tools
---

# {{ title }}


The [AWS command-line interface][] is a handy tool for managing cloud resources.
Below are some pointers to relevant sections of the AWS docs intended to get you up and running quickly.

> If you created an administrator account based on the steps in [Create a Static Website][], you'll 
want to set up both a default configuration for your root account and a profile
for an administrator account. Below, we assume you plan to do both (the `stanford` profile represents the administator account). If you only created a root account,
just include the *default* settings.

[AWS command-line interface]: https://aws.amazon.com/cli/
[Create a Static Website]: https://data-driven.news/how-to/create-a-static-website/

## Install

The first step is to follow the [install instructions][] appropriate for your OS.

[install instructions]: https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html

## Configure

Next, you'll want to [configure the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html#cli-quick-configuration). As mentioned in these instructions, you should run the `aws configure`
command twice if you have both a root and an administrator account. The second time you'll need to specify the name of a profile. This profile name can then be referenced when using the various AWS CLI tools. Make sure to have your [access keys][]
handy when setting up the credentials.

When the configuration process is complete, you should have several new files in a hidden `~/.aws` directory.
Again, the `default` credentials/config represent the root account, while `stanford` represents the administrator account.

### Example: ~/.aws/credentials

```
[default]
aws_access_key_id = <YOUR_AWS_ACCESS_KEY>
aws_secret_access_key = <YOUR_AWS_SECRET_KEY>

[stanford]
aws_access_key_id = <YOUR_AWS_ACCESS_KEY>
aws_secret_access_key = <YOUR_AWS_SECRET_KEY>
```

### Example: ~/.aws/config

```
[default]
output = json
region = us-east-1

[profile stanford]
output = text
region = us-east-1
```

[access keys]: https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys

## Usage

Once the AWS CLI is configured locally, you can use the tools as below:

```
# Use the default root account credentials
aws acm list-certificates

# Use the "stanford" administrator credentials
aws acm --profile stanford list-certificates
```