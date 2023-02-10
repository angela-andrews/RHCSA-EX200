# SSH

## Authentication using public/private key pairs
* Public Key Encrypts the Data
* Private Key Decrypts the Data
  - Private keys can be secured with a passphrase

Create a key pair
```
$ ssh-keygen
```

Copy default public key to remote server
```
$ ssh-copy-id username@servername
```

Log into remote server with specific key
```
$ ssh -i /path/to/key username@servername
```
Single line command to create a keypair with blank passphrase 
```
$ ssh-keygen -N '' -f ~/.ssh/my_rsa
```
* -N is for new passphrase
* ' ' (empty quotes) is the blank passphrase
* -f is the file location of the private key

Enable non-interactive authenication (Basic SSO) with ssh-agent & ssh-add
 * ssh-agent - holds private keys. Used for authentication. Exports PID to environment variable
 * ssh-add - Adds private key to the ssh-agent
 * eval - The arguments are read & cat'd as a single command. The command is then executed by the shell

 ```
 $ eval $(ssh-agent)
 $ ssh-add [path to key]
 $ ssh username@servername
 ```

SSH Troubleshooting
When ssh auth isn't working you can set the verbosity level & read the logs for more information
```
$ ssh -v username@servername
```

SSH Config file to manage multiple ssh connections
You can set connections paramters inside the ~/.ssh/config file to preconfigure host connection settings (think aws config). Populate the file with the host, username and key file used for that connection.

![Example of .ssh/config file](/images/ssh-config-example.png)

