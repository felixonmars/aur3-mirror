# Maintainer: dreieck
# Contributor: twa022 <twa022@gmail.com>

pkgname=xfprint-devel
pkgver=4.6.1
pkgrel=4
pkgdesc="A printer manager for Xfce (Development Version)"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
depends=("libxfcegui4>=$pkgver" "xfconf>=$pkgver" 'libcups>=1.3.10' 'a2ps' 'heimdal>=1.2.1-3' 'gnutls>=2.6.5' 'hicolor-icon-theme')
makedepends=('pkgconfig')
options=('!libtool')
conflicts=('xfprint')
provides=("xfprint=${pkgver}")
install=xfprint.install
source=(http://www.xfce.org/archive/xfce/${pkgver}/src/xfprint-${pkgver}.tar.bz2)
md5sums=('d92fca97a42816085080baf07a99a62e')
sha1sums=('4ce98c49d49b2d4c1a8fb5d76597b8e9ab9a51e8')

build() {
  cd ${srcdir}/xfprint-"${pkgver}"
  export LDFLAGS="-lX11"
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --disable-static || return 1
   make || return 1
}

package() {
  cd ${srcdir}/xfprint-"${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}
