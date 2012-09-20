# created 02:30:20 - 20/08/09
# Maintainer: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=kepas
pkgver=0.9.3
pkgrel=2
pkgdesc="KDE Easy Publish and Share"
arch=('i686' 'x86_64')
url="http://kepas.sourceforge.net"
license=('GPL')
depends=('kdelibs')
source=("http://mesh.dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        "01-linker-fix.patch"
        )
md5sums=('123fcb6c7fdf47f8830caf700c97f53d'
         '5a8743d0a6d0b2467decfe3aea5af91f')
install=kepas.install

build() {

  cd $srcdir/$pkgname-$pkgver
  patch -p1 -i ../01-linker-fix.patch

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1

}
