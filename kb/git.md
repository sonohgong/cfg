## Git

### GitHub

Finding all issues that you commented on can be very helpful
as a history view of your activity:

https://github.com/issues?q=is%3Aissue+commenter%3A<username>

### Signing

Creating a GPG key:
```
gpg --full-generate-key 
```

Export the public key part of your key for use in GitHub with:
```
gpg --export --armor <name>
```

Listing GPG keys with the ID to use in git config:
```shell
gpg --list-secret-keys --keyid-format LONG <name>
```

### Submodules

Updating submodules to their latest version:
```
git submodule update --recursive --remote
```
