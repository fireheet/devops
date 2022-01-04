echo "----------------------------------------------------------"
echo "Fireheet development enviroment setup  | File V0.0.1"
echo "----------------------------------------------------------"
echo ""
echo "[Configuration]"
echo "Exporting environment variables..."
echo "NOTE: You may need to restart the terminal"
echo ""
( cd ~/devops/resources && sed -i -ne '/##### BEGIN ENV #####/ {s/.*/&\n/p; r export.env' -e ':a; n; /##### END ENV #####/ {p; b}; ba}; p' ~/.zshrc )  > /dev/null

echo "Exporting environment aliases..."
echo "NOTE: You may need to restart the terminal"
echo ""
( cat ~/devops/resources/.bash_aliases > ~/.oh-my-zsh/custom/aliases.zsh )  > /dev/null

echo ""
echo "[Ansible]"
echo "Installing dependencies and adding some configurations with Ansible..."
cd ~/devops/ansible/local_setup && ansible-playbook -i hosts config-dev-environment.yaml > /dev/null

echo ""
echo "[Terraform]"
echo "Spinning up containers with Terraform..."
cd ~/devops/terraform/local && terraform apply -auto-approve  > /dev/null

echo ""
echo "[Users Service]"
echo "Installing Users Service dependencies..."
docker exec -it $USERS_SVC_CONTAINER_NAME yarn install > /dev/null