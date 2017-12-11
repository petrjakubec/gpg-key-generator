#!/bin/bash

echo '-- Generating entropy'
sudo dd if=/dev/sda of=/dev/null &
TASK_PID=$!

# Batch file with GPG Key parameters
# If not entered Passphrase this way, then dialog to ask for a passphrase will pop-up
cat > gpgparams <<EOF
Key-Type: RSA
Key-Length: 4096
Key-Usage: encrypt
Subkey-Type: RSA
Subkey-Length: 4096
Subkey-Usage: encrypt
Name-Real: User Name
Name-Comment: none
Name-Email: user@server
Expire-Date: 0
Passphrase: hellisreal
%pubring userserver.pub
%secring userserver.sec
%commit
%echo done
EOF

# Generating keys according the bath file
echo '-- Generating keys'
gpg --no-tty --no-permission-warning --homedir . --batch --gen-key gpgparams 2>&1
echo "Result: $?"
echo "Files:"
ls -al

echo && echo '-- Killing entropy generator'
sudo kill $TASK_PID

echo && echo '-- Listing keys'
gpg --homedir . --no-default-keyring --secret-keyring ./userserver.sec --keyring ./userserver.pub --list-secret-keys
# no-default-keyring — do not add the default keyrings to the list of keyrings
# secret-keyring — add a secret keyring   ./userserver.sec

echo && echo '-- exporting public key'
gpg --homedir . --no-default-keyring --secret-keyring ./userserver.sec --keyring ./userserver.pub --export -a user@server > pubkey.txt 2>&1
echo "Files:"
ls -al
echo "Content of public key:"
cat pubkey.txt
