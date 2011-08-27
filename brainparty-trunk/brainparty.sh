if [ ! -d ~/.brainparty-trunk/Content ]; then
    mkdir -p ~/.brainparty-trunk
    ln -s /usr/local/games/brainparty-trunk/Content ~/.brainparty-trunk/Content
fi
 
cd ~/.brainparty-trunk
/usr/local/games/brainparty-trunk/brainparty
cd - &>/dev/null
