# gpg-key-generator
script for unnattanded generating gpg keys

Keys will not be added to your keyring, instead of they will be in secret keyring.
Part of the script is utility for entropy generating in order to create gpg keys.

Keys are generated with hardcoded passphrase, otherwise we would get dialog window for entering passphrase during keys generating.

- List of private keys from your keyring (will be without this new generated key)
```$ gpg -K```

- List of all public keys from your keyring (will be without this new generated key)
```$ gpg -k```
