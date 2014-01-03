# Maintainer: 404
# Contributor carstene1ns <arch carsten-teibes de>
# Contributor: Heine Laursen <zann at gmail dot com>
# Contributor: Christoph Zeiler <rabyteNOSPAM_at_gmx.dot.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Adam Griffiths <adam_griffithsAATTdart.net.au>

pkgname=ode-compat
pkgver=0.12
pkgrel=4
pkgdesc="An open source, high performance library for simulating rigid body dynamics"
arch=('i686' 'x86_64')
url="http://www.ode.org"
license=('LGPL' 'BSD')
options=('!libtool')
provides=('ode')
conflicts=('ode')
source=("http://downloads.sourceforge.net/opende/ode-$pkgver.tar.bz2")
md5sums=('48fdd41fae1a7e7831feeded09826599')

build() {
  cd ode-$pkgver

  LIBS="$LIBS -lX11" ./configure --prefix=/usr --enable-shared \
    --enable-release --disable-asserts --with-trimesh=opcode

  make
}

package() {
  cd ode-$pkgver

  make DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
