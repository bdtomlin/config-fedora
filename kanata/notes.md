# Running in the background

## Build to get the latest
git clone https://github.com/jtroo/kanata
cd kanata
cargo build --release
cd target/release

sudo chown root:root /usr/local/bin/kanata
sudo chown root:root /usr/local/bin/kanata

- move the binary to `sudo mv kanata /usr/local/bin`
- change the owner `sudo chown root:root /usr/local/bin/kanata`
- change the permissons `sudo chmod 755 /usr/local/bin/kanata`
- change the selinux flag `sudo chcon -t bin_t /usr/local/bin/kanata`
- to verify: `ls -Z`
- create service `sudoedit /etc/systemd/system/kanata.service`

  ```text
  [Unit]
  Description=Kanata keyboard remapper
  Documentation=https://github.com/jtroo/kanata
  After=network.target

  [Service]
  Type=simple
  ExecStart=/usr/local/bin/kanata --cfg /home/bryan/.config/kanata/conf
  Restart=never

  [Install]
  WantedBy=multi-user.target
  ```

- `sudo systemctl start kanata`
- `sudo systemctl enable kanata`

Should be it! Make sure to keep the conf file synched with the one in
my config files.
