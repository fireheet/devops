# ALIASES

# Local containers
alias ansible-playbook="docker run -it --rm -v ~/devops/ansible:/ansible fireheet/ansible ansible-playbook"

# Users service
alias fheetusers="docker exec -it $USERS_SVC_CONTAINER_NAME"

alias fheetusers-cd="cd $USERS_SVC_PATH"
alias fheetusers-code="code $USERS_SVC_PATH"
alias fheetusers-path="echo $USERS_SVC_PATH"

alias fheetusers-build="docker exec -it $USERS_SVC_CONTAINER_NAME yarn build"
alias fheetusers-build-prod="docker exec -it $USERS_SVC_CONTAINER_NAME yarn build --prod"

alias fheetusers-test="docker exec -it $USERS_SVC_CONTAINER_NAME yarn test"

alias fheetusers-start="docker exec -it $USERS_SVC_CONTAINER_NAME yarn start"