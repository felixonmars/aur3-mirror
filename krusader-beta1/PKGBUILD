# Contributor: fes0 

pkgname=krusader-beta1
realname=krusader
pkgver=2.2.0
subver=beta1
pkgrel=1
pkgdesc="Advanced twin panel file manager for KDE"
arch=('i686' 'x86_64')
url="http://www.krusader.org/"
license=('GPL')
depends=('kdelibs>=4.3.0' 'kdebase-runtime>=4.3.0')
makedepends=('cmake' 'automoc4')
provides=('krusader')
conflicts=('krusader')
replaces=('krusader')
source=(http://downloads.sourceforge.net/project/krusader/krusader/2.2.0-beta1/${realname}-${pkgver}-${subver}.tar.bz2)
md5sums=(71120ee8a188a12f879a6f1330b6b472)

build() {
  cd $startdir/src/$realname-$pkgver-$subver
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make  || return 1
  make DESTDIR=$startdir/pkg install || return 1

}
