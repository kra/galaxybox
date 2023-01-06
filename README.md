# Deploy galaxy box to DigitalOcean

# Requirements

create and verify sendgrid account
create sendgrid sender identity by authenticating domain
create sendgrid SMTP relay API key

# Deploy box

    ansible-playbook -i deploy/hosts deploy/deploy_digitalocean_playbook.yml  --vault-password-file=conf/vault_pass.txt

wait for DNS to propagate with "nslookup immanentizing.eschaton.quest"

- ansible-playbook -i deploy/hosts deploy/secure_playbook.yml
- ansible-playbook -i deploy/hosts deploy/playbook.yml

update 3 DigitalOcean CNAME aliases for sendgrid
wait for DNS to propagate
verify with sendgrid or dig

write /etc/postfix/sasl_passwd

    [smtp.sendgrid.net]:587 apikey:YOUR_API_KEY

perms, config, restart

    sudo chmod 600 /etc/postfix/sasl_passwd
    sudo postmap /etc/postfix/sasl_passwd
    sudo systemctl restart postfix

# notes

https://medium.com/@jalondodson/how-to-configure-a-mail-server-with-a-digital-ocean-droplet-in-2021-d9db016224f7
