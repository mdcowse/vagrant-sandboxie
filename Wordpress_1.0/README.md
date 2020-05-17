![Image](../images/logo.png?raw=true)

# About scenario
This scenario allows you to quickly deploy (~5mins) your wordpress project to
VM lab environment on Windows host.
It can be useful when you already have wordpress projects and you need to test
new features that will be deployed in production environment.

No need to store VM files on your storage permanently.
You can deploy lab environment on demand and remove when your tests will be done.

## Prerequisites
Please read README.md in project root folder.
Also you need to archive your root wordpress folder project and have sql dump.

## Getting Started
There are two simple steps.

1) Copy wordpress project zip archive and sql dump to
vagrant-sandboxie/provision/wordpress/wp-project folder and name files as
project.zip and db.sql.

2) Open cmd or powershell,
navigate to vagrant-sandboxie/Wordpress_1.0 folder and run:

```vagrant up```

When deployment will be done you will be informed in console
that environment is ready to use.

## Removing lab environment

Open cmd or powershell,
navigate to vagrant-sandboxie/Wordpress_1.0 folder and run:

```vagrant destroy```
