pkgname=lightscreen-git
pkgver=20110716
pkgrel=1
pkgdesc="Simple screenshot tool written in Qt"
url="http://lightscreen.sourceforge.net/"
license="GPL"
arch=('any')
makedepends=('git' 'gcc-libs' 'qt')
depends=('qt')
optdepends=('optipng: optimize png screenshots.')
_gitroot='https://github.com/ckaiser/Lightscreen.git'
_gitname='Lightscreen'

build() {
    cd "$srcdir"
  
    msg "Connecting to github GIT server...."

    if [ -d "$srcdir/$_gitname" ] ; then
        cd $_gitname && git pull
    else
        git clone "$_gitroot"
        cd $_gitname
    fi

    qmake
    make
      
    mkdir -p "$pkgdir/usr/bin/"
    install -m 755 lightscreen "$pkgdir/usr/bin/lightscreen"
}
