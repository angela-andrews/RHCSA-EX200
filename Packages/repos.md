# Enable Repositories

## How to enable and disable repos
List all available repos and their status
```
dnf repolist all
```

With CSA, systems can access any repo from any subscription you purchase without attaching a sub.

Enable a repo
```
dnf config-manager --enable [repo name]
```

Disable a repo
```
dnf config-manager --disable [repo name]
```
Add a 3rd party repo 2 ways
1. Via a repo file :star: preferred methods
2. Add a [repository] section to the /etc/dnf/dnf.conf file

:star: Add repo with dnf config-manager
```
dnf config-manager --add-repo="http://repoURL"
```
Parts of a repo file:

![Repo File](/images/repo-file.png)

- Repo file can list multiple keys in 1 file.
- Repo files are located: /etc/yum.repos.d :exclamation:

1. Repo Identifier
2. Name of the repo
3. Base URL or Mirrorlist
4. Is the repo enabled on the system yes or no
5. Will the gpg key be checked yes or no
6. Path to the gpg key

## GPG Keys

Gpg leys should be downloaded and stored instead of letting dnf get the key. A good location for keys is: /etc/pki/rpm-gpg/
Download the key before you download the package. Trust, but verify!

To import a gpg key
```
rpm --import URL_TO_KEY
```

To ignore gpg keys and not have an install check, use --nogpgcheck
```
dnf install --nogpgcheck URL_TO_RPM
```



