cd ~
wget -q https://raw.githubusercontent.com/0x01f/main_arena_offset/master/main_arena
sudo mv main_arena /usr/local/bin/main_arena
sudo chmod +x /usr/local/bin/main_arena
echo "Done! Enjoy it!"
echo -n "Usage:"
echo -e "\033[0;35m$\033[0m \033[01;31mmain_arena\033[0m \033[1;32myour_libc_path\033[0m"
echo "Star it on github <https://github.com/0x01f/main_arena_offset> if you like it."
