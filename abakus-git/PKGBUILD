# Maintainer: darkapex <me@jailuthra.in>

pkgname=abakus-git
_pkgname=abakus
pkgver=20130604
pkgrel=2
pkgdesc="Abakus is a simple calculator for KDE. Think of it as bc (the command-line calculator) with a nice GUI." 
url="https://projects.kde.org/abakus"
depends=('kdebase-runtime' 'qt4')
makedepends=('cmake' 'automoc4' 'flex' 'bison' 'git')
groups=('kdebindings')
conflicts=('abakus')
source=(git://anongit.kde.org/abakus.git) 
arch=('i686' 'x86_64')
license='GPL2' 
md5sums=('SKIP')

build() {
    cd $srcdir/$_pkgname/

    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    make
}

package() {
    make -C "$srcdir/$_pkgname" DESTDIR="$pkgdir" install
}
