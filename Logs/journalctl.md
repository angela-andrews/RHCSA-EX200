# System Journal

To make the system journal persist a reboot, you have to configure it.

1. Edit the /etc/systemd/journald.conf file & set `Storage=persistent` and uncomment
2. `mkdir -v /var/log/journal`
3. `systemctl restart systemd-journald`

## journalctl commands

| Command | Output |
| -------| -------|
| journalctl -b # | Show a specific boot |
| journalctl --list-boots | List boots since persistence set |
| journalctl -b | Current boot


