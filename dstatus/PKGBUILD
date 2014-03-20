pkgname='dstatus'
pkgdesc='status application for dwm'
pkgver=0.4
pkgrel=1
arch=('i686' 'x86_64')
url='http://bitbucket.org/pks/dstatus'
license=('GPL3')
depends=('libx11')
makedepends=('alsa-lib' 'git' 'libmpdclient' 'libnl')
optdepends=('alsa-lib: volume status'
            'libmpdclient: mpd status'
            'libnl: wifi status')
source=("dstatus::git+https://bitbucket.org/pks/dstatus.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"

  sed -i "s|PREFIX = .*|PREFIX = ${pkgdir}/usr|g" config.mk
  sed -i "s|CFLAGS =|CFLAGS +=|g" config.mk
  sed -i "s|LDFLAGS =|LDFLAGS +=|g" config.mk

  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install
}

# vim: ft=sh
