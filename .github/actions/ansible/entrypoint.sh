#!/bin/bash

echo $ANSIBLE_VAULT_PASSWORD >> .vault

ansible-galaxy install -r roles/requirements.yml

if ! ansible-playbook -i <dynamic-inventory>.yml site.yml --vault-password-file .vault; then
  echo "Ansible failed!"
  rm .vault
  exit 1
else
  rm .vault
fi