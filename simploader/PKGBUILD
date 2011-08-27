pkgname=simploader
pkgver=20100330
pkgrel=1
pkgdesc="Uploading files to the popular web services"
arch=('i686' 'x86_64')
url="http://slasyz.github.com/simploader/"
license=('GNU GPL')
depends=('python' 'curl' 'xclip' 'scrot' 'libnotify')
makedepends=('git')

_gitroot='git://github.com/slasyz/simploader.git'
_gitname='simploader'

build() {
    cd $startdir/src
    msg "Connecting to GIT server...."

    if [ -d $startdir/src/$_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
        cd $_gitname
    fi

    cd $startdir/src
    mv -T $_gitname /opt/$_gitname
    cd /opt/$_gitname
    chmod +x paste.py screen.sh simploader.py

    ln -S paste.py /usr/bin/pastebin
    ln -S screen.sh /usr/bin/screen.sh
    ln -S simploader.py /usr/bin/simploader

}

