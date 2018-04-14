Installation
------------

### Unix
1. mkdir ~/.vim ~/.vim/bundle ~/.vim/.backup ~/.vim/.swap ~/.vim/.undo
2. git clone https://github.com/kidquick/vim ~/.vim
3. git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
4. sudo wget https://github.com/powerline/fonts/raw/master/UbuntuMono/Ubuntu%20Mono%20derivative%20Powerline.ttf /usr/share/fonts/Ubuntu\ Mono\ derivative\ Powerline.ttf
5. :PluginInstall

### Windows
1. mkdir %USERPROFILE%\vimfiles %USERPROFILE%\vimfiles\bundle %USERPROFILE%\vimfiles\backup %USERPROFILE%\vimfiles\swap %USERPROFILE%\vimfiles\undo
2. git clone https://github.com/kidquick/vim %USERPROFILE%
3. rename .vimrc _vimrc && rename .gvimrc _gvimrc && rename .vimrc-server _vimrc-server
4. git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%\vimfiles\bundle\Vundle.vim
5. (Install!) wget https://github.com/powerline/fonts/raw/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20for%20Powerline.ttf "%USERPROFILE%\Desktop\DejaVu Sans Mono for Powerline.ttf"
6. :PluginInstall
