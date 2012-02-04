# Maintainer: Peter Hatina <phatina@gmail.com>
pkgname=vpterminal
pkgver=0.5
pkgrel=1
pkgdesc="RS232 terminal program."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/vpterminal/"
license=('GPL')
depends=('qt')
md5sums=() #generate with 'makepkg -g'

build() {
    cd $srcdir
    if [ ! -d $pkgname ]; then
        svn co https://vpterminal.svn.sourceforge.net/svnroot/vpterminal $pkgname
    else
        svn update $pkgname
    fi
    cd $pkgname/trunk
    qmake || return 1
    make || return 1
}


package() {
    cd $pkgdir/
    mkdir -p usr/bin
    cp $srcdir/$pkgname/trunk/bin/$pkgname usr/bin
}
