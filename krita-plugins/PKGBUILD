# Contributor: k79 <sam.sinner@gmail.com>
 
pkgname=krita-plugins
pkgver=1.6.4
pkgrel=1
pkgdesc="Krita-plugins is a set of plugins for Krita 1.6" 
url="http://krita-plugins.org"
depends=('kdelibs' 'koffice')
makedepends=('cmake')
source=(http://www.krita-plugins.org/download/1.6.4/src/krita-plugins-1.6.4.tar.gz)
md5sums=('9b53d650c66fb4db1aa56f27c60ae63d')
arch=(i686)
license="GPL"

build() {
    cd $startdir/src/$pkgname-1.6.4
    cmake -DCMAKE_INSTALL_PREFIX=/opt/kde .
    make || return 1
    make DESTDIR=$startdir/pkg install
}
