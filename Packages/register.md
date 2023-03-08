# Register your RHEL System

- Software packages and updates are stored in a content delivery network (CDN). 
- Updates consist of bug fixes, enhancements, and security advisories.

You can register your system and attach a subscription via the following utilities/tools:
- Web Console
- Subscription-Manager (GUI)
- Subscription-Manager (cli)
- Ansible
- Satellite Server

## DNF and YUM
DNF and YUM are the utilities used for getting updates from the CDN.

## Subscription Manager Tool
- Register a system- associate it with a RH account and with an active sub
- Subscribe a system- entitle it to update, specific support levels, expiration data and get its default repos.
- Enable Repos 
- Review and Track- available and consumed entitlements in the portal

## Simple Content Access
- Provides Subscriptions Management capabilities.
- Enabled for the entire organization to simplify the entitlement process.
- Removes the need to attach subs on a per system basis

## Using Cockpit to subscribe a system
![Red Hat Subscription Manager App](/images/subscription-maanger-gui-icon.png)

- Run the subscription  manager application & authenticate
- Fill out the form with your username and password to register your system.

## Using the CLI to subscribe a system
Register a system:
```
subscription-manager register --username USERNAME
```

Unregister a system:
```
subscription-manager unregister
```

View available subs:
```
subscription-manager list --available
```

Auto-Attach subscriptions:
```
subscription-manager attach --auto
```

Attach Subscriptions from a specific pool:
```
subscription-manager attach --pool=POOLID
```

Review Consumed Subs:
```
subscription-manager list --consumed
```

## Activation Keys
An activation key is a pre-configured file that can be used with Satellite and subscription manager. They assist you with registering systems and attaching subs.
- use subscription-manager with activation keys to simplify the registration process and assignment of subs.
- activation keys are goos with automating installs
- with SCA, activations keys can:
    1. register a system
    2. enable repos without needing to attach subs


## Entitlement Certificates
Digital certificates store current entitlement info on the local system in the /etc/pki directory.
- /etc/pki/product: Indicates installed RH products
- /etc/pki/consume: Indicates the RH account for registration
- /etc/pki/entitlement: Indicates which subs are attached

rct- Red Hat subscription-manager certificate tool. Displays information about entitlements, products or identity certs.


