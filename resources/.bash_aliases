# ALIASES
# To update Aliases commands:
# 
# Bash:
# cat ~/devops/resources/.bash_aliases > ~/.bash_aliases
# 
# ZSH:
# cat ~/devops/resources/.bash_aliases > ~/.oh-my-zsh/custom/aliases.zsh

# ---------- Utils BEGIN ---------------
alias export-env="clear && cd ~/devops/resources && sed -i -ne '/##### BEGIN ENV #####/ {s/.*/&\n/p; r local.env' -e ':a; n; /##### END ENV #####/ {p; b}; ba}; p' ~/.zshrc && echo 'Fireheet Environment variables to ~/.zshrc. Please restart your terminal!'"
alias export-aliases="clear && cat ~/devops/resources/.bash_aliases > ~/.oh-my-zsh/custom/aliases.zsh && echo 'Fireheet aliases exported. Please restart your terminal!'"
# ---------- Utils END ---------------

# ---------- Git BEGIN ---------------
alias commit="npx cz"
# ---------- Git END ---------------

# ---------- Devops BEGIN ---------------
alias devops-cd="clear && cd ~/devops"

alias terraform-cd="clear && cd ~/devops/terraform"
alias terraform-local-cd="clear && cd ~/devops/terraform/local"

alias ansible-cd="clear && cd ~/devops/ansible"
alias ansible-local-cd="clear && cd ~/devops/ansible/local_setup"

alias devinit="clear && bash ~/devops/resources/utils/initialize_env.sh"
alias devconfig="clear && ansible-local-cd && ansible-playbook -i hosts config-dev-environment.yaml"

alias devup="clear && terraform-cd && cd local && terraform apply -auto-approve"
alias devdown="clear && terraform-cd && cd local && terraform apply -destroy -auto-approve"
alias devrestart="devdown && devup"
# ---------- Devops END ---------------


# ---------- Users service BEGIN ---------------
alias users-bash="docker exec -it $USERS_SVC_CONTAINER_NAME bash"
alias users-add="users yarn add"

alias users-cd="clear && cd $USERS_SVC_PATH"
alias users-code="code $USERS_SVC_PATH"
alias users-path="echo $USERS_SVC_PATH"

alias users-build="clear && docker exec --rm -it $USERS_SVC_CONTAINER_NAME yarn build"
alias users-build-prod="clear && docker exec --rm -it $USERS_SVC_CONTAINER_NAME yarn build --prod"
alias users-build-img="clear && docker build -t fireheet/dev-env ~/devops/images/fireheet/dev_env"

alias users-test="clear && docker run -it --rm -p 3000:3000 -v $USERS_SVC_PATH:/app --name users_svc_dev --net fireheet_net fireheet/dev-env yarn test"

alias users-start="clear && docker run -it --rm -p 3000:3000 -v $USERS_SVC_PATH:/app --name users_svc_dev --net fireheet_net fireheet/dev-env yarn start:dev"
alias users-remove="docker stop users_svc_dev && docker container rm users_svc_dev"
alias users-restart="clear && users-remove && users-start"
# ---------- Users service END ---------------""