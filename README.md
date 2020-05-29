Installation
------------

### Unix
    git clone https://github.com/kidquick/vim ~/.vim
    mv .gvimrc .vimrc .vimrc-server ~
    mkdir ~/.vim/bundle ~/.vim/.backup ~/.vim/.swap ~/.vim/.undo
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    sudo wget https://github.com/powerline/fonts/raw/master/UbuntuMono/Ubuntu%20Mono%20derivative%20Powerline.ttf /usr/share/fonts/Ubuntu\ Mono\ derivative\ Powerline.ttf
    wget https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim ~/.vim/colors
    :PluginInstall

### Windows
    mkdir %USERPROFILE%\vimfiles %USERPROFILE%\vimfiles\bundle %USERPROFILE%\vimfiles\backup %USERPROFILE%\vimfiles\swap %USERPROFILE%\vimfiles\undo
    git clone https://github.com/kidquick/vim %USERPROFILE%
    rename .vimrc _vimrc && rename .gvimrc _gvimrc && rename .vimrc-server _vimrc-server
    git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%\vimfiles\bundle\Vundle.vim
    (Install!) wget https://github.com/powerline/fonts/raw/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20for%20Powerline.ttf "%USERPROFILE%\Desktop\DejaVu Sans Mono for Powerline.ttf"
    wget https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim %USERPROFILE%\vimfiles\colors
    :PluginInstall
