# if [ -n "$XDG_RUNTIME_DIR" ]; then
#     export GNOME_KEYRING_CONTROL=${XDG_RUNTIME_DIR}/keyring
#     eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
#     export SSH_AUTH_SOCK
# fi
#
export SYSTEMD_LOG_LEVEL=err
