# $Id: PKGBUILD 82 2009-07-17 19:56:55Z aaron $
# Maintainer: Martin Lukeš <martin.meridius@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Thomas Baechler <thomas.baechler@rwth-aachen.de>

pkgname=siefs
pkgver=0.5
pkgrel=2
pkgdesc='Mount FlexMEM on Siemens Mobile phones'
arch=('i686' 'x86_64')
url='http://chaos.allsiemens.com/siefs/'
depends=('fuse')
license=("GPL")
source=("http://chaos.allsiemens.com/download/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.patch")
md5sums=('974328fc20b99e975d03a312a2814ed8'
         '5c1c7aa5e57f7524b4aeec4167ae90a4')

build() {
  cd ${pkgname}-${pkgver}

  patch -p1 -i ../siefs.patch

  sed -i "s:\$(fuseinst)/lib/libfuse.a:-lfuse:" siefs/Makefile.{am,in}

  LDFLAGS="-ldl -lrt" ./configure \
    --prefix=/usr

  make
}

package() {
  cd ${pkgname}-${pkgver}

  mkdir -p ${pkgdir}/sbin

  make DESTDIR=${pkgdir} install
}
