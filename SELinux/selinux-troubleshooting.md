# Troubleshooting SELinux

There are several tools that assist you in finding and resolving your SELinux issues.

## Packages to install

To be sure you have the tools, install these packages

- setroubleshoot-server : the tools to diagnose SELinux issues
  - policycoreutils-python-utils : honorable mention in the SELinux [documentation](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html-single/using_selinux/index#analyzing-an-already-found-selinux-denial_troubleshooting-problems-related-to-selinux). Contains the management tools used in SELinux
- selinux-policy-doc : provides selinux policy man pages

```
dnf install setroubleshoot-server policycoreutils-python-utils selinux-policy-doc -y
```

## SELinux Deny Messages
When SELinux denies an action, an Access Vector Cache (AVC) message is logged to /var/log/audit/audit.log. The SELinux troubleshoot service monitors for AVC messages in audit.log, then sends them to /var/log/messages.
- sealert comes from the setroubleshoot-server package

The SELinux troubleshoot service is called setroubleshootd. It's the daemon for processing new SELinux denial logs. 

```
systemctl status --full setroubleshootd
```

In /var/log/messages, there may be an entry that recommends you use the sealert command with a specific event UUID to get more information about your denial. Sealert is a log analysis tool

```
sealert -l 242c4f1c-3081-493a-bb58-8f5ee5d203ac
```
The output of the command will tell you what SELinux is doing with a certain degree of confidence and will provide a suggested remedy.

![sealert output](/images/sealert.png)

Beyond the long list of types, you'll see the suggestion to run restorecon as well

![sealert output restorecon](/images/sealert-restorecon.png)

## Troubleshooting tips

1. grep /var/log/audit/audit.log for AVC
2. grep /var/log/messages for sealert
3. run the sealert command with the event UUID as suggested. Review the output with the highest confidence level.
4. run ausearch -m AVC -ts dd/mm/yyyy  (or -ts recent) to see the more detail about the AVC message, similar to the output from sealert
5. Re-confirm that it's SELinux by setting it to permissive mode & testing.
6. If it works,re-enable SELinux and then run the suggested commands.
7. Test 

```
grep AVC /var/log/audit/audit.log
grep sealert /var/log/messages
sealert -l d4878356-3292-4621-b24f-7f3e3af75338 | grep httpd
ausearch -m AVC -ts yesterday
setenforce 0
setenforce 1
semanage fcontext -a -t httpd_sys_content_t '/webserver(/.*)?'
restorecon -RFv /webserver
```
## Using Cockpit to troubleshoot SELinux

Confirm that cockpit is installed and the socket is running. Also, make sure it's allowed into your firewall.
```
dnf install cockpit
systemctl enable --now cockpit.socket
systemctl status cockpit.socket
```

### Cockpit can be accessed via a web browser on port 9090.

- Here you can easily switch between enforcing and permissive
- You can see what local changes have been made
- Denial errors are displayed and provide solution details

![cockpit-enable](/images/selinux-cockpit1.png)
![cockpit-enable](/images/selinux-cockpit2.png)


