# Contributor: Andreas Schwoll <aktogaj@gmail.com>

pkgname=esvn
pkgver=0.6.12
pkgrel=1
pkgdesc="Esvn Qt based Subversion client"
url="http://esvn.umputun.com"
license="GPL"
arch=('i686' 'x86_64')
depends=('subversion' 'qt')
source=(http://dl.sf.net/sourceforge/esvn/$pkgname-$pkgver-$pkgrel.tar.gz
        install_fix.patch)
#options=(docs)

build() {
    cd $startdir/src/$pkgname
    patch Makefile ../install_fix.patch || return 1
    make all || return 1
    make DESTDIR=$startdir/pkg install || return 1
}

md5sums=('c46ffee6188dc28604c7cc9e5dbf082e'
         '16b32582b17300ef46f5f4823c5f66b6')
