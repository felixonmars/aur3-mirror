# Maintainer: examon <examon.mail[at]gmail[dot]com>
pkgname=gshot
pkgver=0.8.3
pkgrel=3
pkgdesc="Capturing a snapshot/screenshot of the entire screen, a single window or user selected region"
url="http://gshot.googlecode.com"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('bash' 'gtk2' 'gettext' 'intltool' 'libunique')
source=("$url/files/${pkgname}-${pkgver}.tar.xz")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  export LDFLAGS="-lX11"
  ./configure --prefix=/usr || return 1
  make || return 1
  make prefix=${pkgdir}/usr install || return 1
}

sha1sums=('b4d3e1db51e6290fe4c6e1606f8708abc97b8055')
