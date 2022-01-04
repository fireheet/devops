# ALIASES
# To update Aliases commands:
# 
# Bash:
# cat ~/devops/resources/.bash_aliases > ~/.bash_aliases
# 
# ZSH:
# cat ~/devops/resources/.bash_aliases > ~/.oh-my-zsh/custom/aliases.zsh

# ---------- Utils BEGIN ---------------
alias export-env="cd ~/devops/resources && sed -i -ne '/##### BEGIN ENV #####/ {s/.*/&\n/p; r export.env' -e ':a; n; /##### END ENV #####/ {p; b}; ba}; p' ~/.zshrc"
alias export-aliases="cat ~/devops/resources/.bash_aliases > ~/.oh-my-zsh/custom/aliases.zsh"
# ---------- Utils END ---------------


# ---------- Devops BEGIN ---------------
alias devops-cd="cd ~/devops"

alias terraform-cd="cd ~/devops/terraform"
alias terraform-local-cd="cd ~/devops/terraform/local"

alias ansible-cd="cd ~/devops/ansible"
alias ansible-local-cd="cd ~/devops/ansible/local_setup"

alias devinit="bash ~/devops/resources/utils/initialize_env.sh"
alias devconfig="ansible-local-cd && ansible-playbook -i hosts config-dev-environment.yaml"

alias devup="terraform-cd && cd local && terraform apply -auto-approve"
alias devdown="terraform-cd && cd local && terraform apply -destroy -auto-approve"
alias devrestart="devdown && devup"
# ---------- Devops END ---------------


# ---------- Users service BEGIN ---------------
alias users-bash="docker exec -it $USERS_SVC_CONTAINER_NAME bash"
alias users-add="users yarn add"

alias users-cd="cd $USERS_SVC_PATH"
alias users-code="code $USERS_SVC_PATH"
alias users-path="echo $USERS_SVC_PATH"

alias users-build="docker exec --rm -it $USERS_SVC_CONTAINER_NAME yarn build"
alias users-build-prod="docker exec --rm -it $USERS_SVC_CONTAINER_NAME yarn build --prod"
alias users-build-img="docker build -t fireheet/dev-env ~/devops/images/fireheet/dev_env"

alias users-test="docker run -it --rm -p 3000:3000 -v $USERS_SVC_PATH:/app --name users_svc_dev --net fireheet_net fireheet/dev-env yarn test"

alias users-start="docker run -it --rm -p 3000:3000 -v $USERS_SVC_PATH:/app --name users_svc_dev --net fireheet_net fireheet/dev-env"
alias users-remove="docker stop users_svc_dev && docker container rm users_svc_dev"
alias users-restart="users-remove && users-start"
# ---------- Users service END ---------------