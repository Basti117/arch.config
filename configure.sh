echo "Installing git and python..."
sudo pacman -S git python

echo "Building setup dir with scripts..."
setup_dir="${HOME}/.setup/arch.config"
mkdir -p $setup_dir
git clone https://github.com/Basti117/arch.config.git ${setup_dir}
cd $setup_dir

echo "Creating .venv..."
python -m venv .venv
source .venv/bin/activate

echo "Installing ansible dependencies..."
python -m pip install ansible cryptography
ansible-galaxy collection install -r requirements.yml

echo "Configuring setup..."
ansible-playbook main.yml -i inventory/ -K

