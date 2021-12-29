## Fireheet DevOps

This repository will contain all **DevOps** files for the project, both *DEV* and *PROD* environments setups.

To get help on installing and setting things up, go through the [Setups | Environment Setup](https://fireheet.bit.ai/docs/m8ugErvLQlsUXLBv) documentation on Bit.ai.

The Development enviroment will install ( Most services are started with **Docker Compose**):
:x: To Do :chart: Done

- Docker :chart:
- Docker Compose :chart:
- Nginx :x:
- RabbitMQ :chart:
- PostgresDB :x:
- Redis :x:
- Elastic APM Agent :x:

Template (Not working :x:)
-----
To start the project just execute this command:


    ansible-playbook -i hosts ~/devops/ansible/projects/setup-{$PROJECT_NAME}.yaml
