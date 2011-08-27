# Maintainer: masutu <masutu dot arch at gmail dot com>
# Contributor: PapaNappa <a31bd12e at freenet dot de>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=pokerclock
pkgver=1.0.6
pkgrel=1
pkgdesc="A poker clock"
arch=('i686' 'x86_64')
license=("GPL")
url="http://sourceforge.net/projects/pokerclock/"
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tgz"
				"pokerclock_patch.diff")
md5sums=('f69aa9416c735b83ae4106b62245d998'
         'db3d62608dd5364fe4bb7ab0702e027d')

build() {
  cd $srcdir/$pkgname/
  mv src/sounds/event.wav src/sounds/pokerclock-event.wav
  patch -uNp1 -i ../../pokerclock_patch.diff
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
  make
}

package() {
  cd $srcdir/$pkgname/build
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
