# gpg-key-generator

Script for unattanded generating gpg keys for later distribution on servers.

Keys will not be added to your keyring, will be in secret keyring instead.
Part of the script is utility for entropy generating in order to create quality 4096 RSA gpg keys.

Keys are generated with hardcoded passphrase, otherwise we would get dialog window for entering passphrase during keys generating.

Run script:
```
git clone https://github.com/xjakube2/gpg-key-generator
cd gpg-key-generator
chmod +x gpg_key_generator.sh
./gpg_key_generator.sh
```

List of all public keys from your keyring (will be without this new generated key):
```
gpg -k || gpg --list-keys
```

List of private keys from your keyring (will be without this new generated key):
```
gpg -K
```

If something fails, you can delete the keys and start over, for deleting secret keys:
```
gpg --delete-secret-keys <keyid>
```
for deleting public keys:
something fails, you can delete the keys and start over, for deleting secret keys:
```
gpg --delete-key <keyid>
```
