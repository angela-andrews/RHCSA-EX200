# Support From Red Hat

Systems with valid subscriptions can get support via the portal
```
https://access.redhat.com
```

Severity Levels
1. Urgent Production Down
2. Prod environment functioning, but impacted
3. Partial loss, non-critial issue
4. General Usage question, documentation error. No impact

SOS Reports contains info to provide to support to help triage your case.

Install sos 
```
# dnf install sos
```

Generate report 2 ways
1. In cockpit
2. Via command line

Cockpit
1. Connect to server (if remote) & install sos 
2. Start the cockpit.socket service
3. Access the web console https://servername:9090
4. Select Diagnostic Reports > Create Report
5. Download Report

Via command line
```
# dnf install sos
# systemctl start cockpit.socket && systemctl status cockpit.socket
# sos report
# sos report --upload
```



