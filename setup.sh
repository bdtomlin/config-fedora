#!/usr/bin/env bash

#Programs
sudo dnf copr enable -y lihaohong/yazi
sudo dnf copr enable -y atim/starship
sudo dnf copr enable -y peterwu/rendezvous
sudo dnf copr enable -y varlad/zellij
sudo dnf copr enable -y atim/lazygit
sudo dnf copr enable -y jdxcode/mise
sudo dnf copr enable -y jdxcode/mise
sudo dnf copr enable -y scottames/ghostty
sudo dnf copr enable wezfurlong/wezterm-nightly

sudo dnf install -y \
  neovim \
  stow \
  yazi \
  direnv \
  bat \
  starship \
  mise \
  bibata-cursor-themes \
  zellij \
  atuin \
  git-delta \
  powertop \
  btop \
  postgresql \
  postgresql-server \
  postgresql-contrib \
  postgresql-devel \
  lazygit \
  ghostty \
  wezterm \
  just \
  rbenv \
  lsd

flatpak install -y flathub \
  io.github.realmazharhussain.GdmSettings \
  io.missioncenter.MissionCenter \
  it.mijorus.gearlever \
  io.github.getnf.embellish \
  flathub org.signal.Signal

# Jetbrains Mono Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
unzip JetBrainsMono.zip -d JetBrainsMono
mv JetBrainsMono/*.ttf ~/.local/share/fonts/
fc-cache -fv
rm JetBrainsMono.zip
rm -rf JetBrainsMono

# 1password
sudo systemctl enable postgresql
sudo postgresql-setup --initdb --unit postgresql

# 1password
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
sudo dnf install 1password

# github cli
if ! command -v gh >/dev/null 2>&1; then
  sudo dnf install dnf5-plugins
  sudo dnf config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo
  sudo dnf install gh --repo gh-cli
  git config --global user.name "bryan@tomlin.email"
  git config --global user.email "bryan@tomlin.email"
  gh auth login
fi

# kanata
# 1. Download the latest Linux x64 zip, extract, and move binary
wget https://github.com/jtroo/kanata/releases/latest/download/linux-binaries-x64.zip &&
  unzip linux-binaries-x64.zip &&
  chmod +x kanata_linux_x64 &&
  sudo mv kanata_linux_x64 /usr/local/bin/kanata &&
  rm kanata_linux_cmd_allowed_x64 &&
  rm linux-binaries-x64.zip

# 2. Setup groups and user permissions
sudo groupadd -f uinput &&
  sudo usermod -aG input $USER &&
  sudo usermod -aG uinput $USER

# 3. Create udev rules without an editor
echo 'KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"' | sudo tee /etc/udev/rules.d/99-kanata.rules >/dev/null

# 4. Apply udev and SELinux memory-map fix
sudo udevadm control --reload-rules && sudo udevadm trigger &&
  sudo setsebool -P domain_can_mmap_files 1

# 5. Final Version Check
kanata --version

sudo useradd -r -s /usr/sbin/nologin kanata
sudo usermod -aG input,uinput kanata
sudo mkdir -p /etc/kanata
# Copy your config from your repo/home to the system path
sudo cp ~/.config/kanata/config.kbd /etc/kanata/config.kbd
sudo chown -R kanata:kanata /etc/kanata

cat <<EOF | sudo tee /etc/systemd/system/kanata.service >/dev/null
[Unit]
Description=Kanata remapper (Global)
Documentation=https://github.com/jtroo/kanata
DefaultDependencies=no
After=udevadm-settle.service
Before=display-manager.service

[Service]
Type=simple
User=kanata
Group=kanata
ExecStart=/usr/local/bin/kanata --cfg /etc/kanata/config.kbd
Restart=always
RestartSec=3

[Install]
WantedBy=sysinit.target
EOF

sudo setsebool -P domain_can_mmap_files 1
sudo chcon -t bin_t /usr/local/bin/kanata
sudo chown root:root /usr/local/bin/kanata
sudo chmod 755 /usr/local/bin/kanata
sudo chown -R kanata:kanata /etc/kanata
sudo chmod 644 /etc/kanata/config.kbd
sudo systemctl daemon-reload
sudo systemctl enable --now kanata.service

# change shell to zsh if not already
[[ "$SHELL" == *"zsh"* ]] || chsh -s "$(which zsh)"
