# Infrastructure

## Bootstrap a single server
```
ansible-playbook bootstrap.yml --limit HOSTNAME
```

## Set up a staging environment
```
vagrant up
ansible-playbook combined.yml --limit staging
```

## Only update the backend
```
ansible-playbook backend.yml --tags update --limit HOSTNAME
```

## Manually create a database backup
```
ansible-playbook create_db_backup.yml --limit HOSTNAME
```

## Restore a database backup
```
ansible-playbook restore_db_backup.yml --limit HOSTNAME
```