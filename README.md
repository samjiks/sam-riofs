# riofs

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with riofs](#setup)
    * [What riofs affects](#what-riofs-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with riofs](#beginning-with-riofs)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

A one-maybe-two sentence summary of what the module does/what problem it solves.
This is your 30 second elevator pitch for your module. Consider including
OS/Puppet version it works with.

## Module Description

If applicable, this section should have a brief description of the technology
the module integrates with and what that integration enables. This section
should answer the questions: "What does this module *do*?" and "Why would I use
it?"

If your module has a range of functionality (installation, configuration,
management, etc.) this is the time to mention it.

## Setup

### What riofs affects

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form.

### Setup Requirements **OPTIONAL**

### Beginning with riofs

Download the module to the puppet module and use the below class, you can change the below paramenters 
to valid parameters to the 

## Usage

class { 'riofs' :
          packages_ensure       => present,
          aws_access_key_id     => 'your access key id', 
          aws_bucket_name       => 'riofs',
          path_to_mount         => '/mnt/riofs',
          aws_secret_access_key => 'your secret aaccess_key',       
}


## Reference


## Limitations

RioFs doesn't work under Windows, Still haven't tested with MACOSX or other Linux flavors 

## Development

This module is still under construction

## Release Notes/Contributors/Etc **Optional**

Anyone can contribute to the project to give more adhere work

