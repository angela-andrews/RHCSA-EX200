# Logging 

Systemd-journald and rsyslog service handles the syslog messages in RHEL9.

## Systemd-Journald
Collects messages from a variety of sources
- System Kernel
- Boot process
- Errors from daemons (stdout & stderr)
- syslog event

Systemd-journald logs don't persist across reboots.

## Rsyslog
Rsyslog reads logs from systemd-journald and sends them to log files
- /var/log/messages
- /var/log/secure
- /var/log/cron
- /var/log/maillog
- /var/log/boot.log

Config Files: determing how to handle log files
- /etc/rsyslog.conf
- /etc/rsyslog.d/*.conf



Log events get sorted by a facility and a priority

| Code | Facility | Description
|---------|-------|---------|
| 0 | kern | Kernel Messages |
| 1 | user | User-level Messages |
| 2 | mail | Mail system messages |
| 3 | deamon | System daemon messages | 
| 4 | auth | Authentication and security messages |
| 5 | syslog | Internal syslog messages |
| 6 | lpr | Printer Messages |
| 7 | news | Network News Messages | 
| 8 | uucp | UUCP protocol messages | 
| 9 | cron | Clock daemon messages | 
| 10 | authpriv | Non-system authorizaion messages |
| 11 | ftp | FTP protocol messages |
| 16-23 | local0 to local7 | Custom Local messages|

Syslog Priorities
| Code | Priority | Description
|---------|-------|---------|
| 0 | emerg | System is unusable |
| 1 | alert | Action must be taken immediatly |
| 2 | crit | Critical Condition |
| 3 | err | Non-Critical error |
| 4 | warning | Warning Condition |
| 5 | notice | Normal but significant event | 
| 6 | info | informational event |
| 7 | debug | Debugging messages |

![facility and priority](/images/rsyslog-conf.png)

## Sending syslog messages manually
Use the logger utility:

` # logger -p user.notice "Test log entry" `

- -p is for the priority

## Create a custom config file 
1. Create a file in /etc/rsyslog.d/ directory with a .conf extension
2. Set the facility.priority then the locaiton of the log file.
3. Restart rsyslog service
4. Test logging with the logger command.


`vim /etc/rsyslog.d/debug01.conf -
systemctl restart rsyslog -
logger -p user.debug "Testing logging" -
tail /var/log/debug-msg`



See the man page for logger and rsyslog.conf for examples.
