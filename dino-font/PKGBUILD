# Maintainer: wsliang <iceeight@gmail.com>
pkgname=dino-font
pkgver=20120218
pkgrel=4
pkgdesc="A modification of the Dina font"
url="http://github.com/wsliang/dino"
arch=('any')
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('git')
install=dino.install

_gitroot="git://github.com/wsliang/dino.git"
_gitname="dino"

build() {
    cd ${srcdir}
    msg "Connecting to GIT server..."
    if [ -d ${srcdir}/$_gitname ]; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
        cd $_gitname
    fi
    msg "GIT checkout done or server timeout"

    cd "fonts"
    install -d "$pkgdir/usr/share/fonts/local"
    install -m644 *.pcf "$pkgdir/usr/share/fonts/local/"
} 
