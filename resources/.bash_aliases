# ALIASES
# To update Aliases commands:
# 
# Bash:
# cat ~/devops/resources/.bash_aliases > ~/.bash_aliases
# 
# ZSH:
# cat ~/devops/resources/.bash_aliases > ~/.oh-my-zsh/custom/aliases.zsh

# Utils
alias export-env="devops-cd && cd ./resources && sed -i -ne '/##### BEGIN ENV #####/ {s/.*/&\n/p; r export.env' -e ':a; n; /##### END ENV #####/ {p; b}; ba}; p' ~/.zshrc"
alias export-aliases="cat ~/devops/resources/.bash_aliases > ~/.oh-my-zsh/custom/aliases.zsh"

# Helpers
alias devops-cd="cd ~/devops"

alias terraform-cd="cd ~/devops/terraform"
alias ansible-cd="cd ~/devops/ansible"

alias devinit="bash ~/devops/resources/utils/initialize_env.sh"
alias devconfig="ansible-cd && ansible-playbook -i hosts ./local_setup/config-dev-environment.yaml"

alias devup="terraform-cd && cd local && terraform apply -auto-approve"
alias devdown="terraform-cd && cd local && terraform apply -destroy -auto-approve"
alias devrestart="devdown && devup"

alias build-img="devops-cd && cd ./images/fireheet && docker build"

# Users service
alias fheetusers="docker exec -it $USERS_SVC_CONTAINER_NAME"
alias fheetusers-add="fheetusers yarn add"

alias fheetusers-cd="cd $USERS_SVC_PATH"
alias fheetusers-code="code $USERS_SVC_PATH"
alias fheetusers-path="echo $USERS_SVC_PATH"

alias fheetusers-build="docker exec -it $USERS_SVC_CONTAINER_NAME yarn build"
alias fheetusers-build-prod="docker exec -it $USERS_SVC_CONTAINER_NAME yarn build --prod"

alias fheetusers-test="docker exec -it $USERS_SVC_CONTAINER_NAME yarn test"

alias fheetusers-start="docker exec -it $USERS_SVC_CONTAINER_NAME yarn start"