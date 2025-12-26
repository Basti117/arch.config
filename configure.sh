echo "Installing dependencies..."
sudo pacman -S python pipx git
pipx install --include-deps ansible

setup_dir="${HOME}/.setup/arch.config"
mkdir -p $setup_dir
git clone https://github.com/Basti117/arch.config.git ${setup_dir}

echo "Configuring setup..."
ansible-playbook ${setup_dir}/arch/config/playbooks/configure.yml -i ${setup_dir}/inventory/
