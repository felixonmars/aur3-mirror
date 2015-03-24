# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>

pkgname=libopensync-plugin-gnokii-stable
_realname=libopensync-plugin-gnokii
pkgver=0.22
pkgrel=2
pkgdesc="Gnokii Plugin for OpenSync 0.2x"
url="http://www.opensync.org"
license="LGPL"
arch=('i686' 'x86_64')
depends=('gnokii' 'libopensync-stable')
options=(!libtool)
source=(http://archive.ubuntu.com/ubuntu/pool/universe/libo/${_realname}/${_realname}_${pkgver}.orig.tar.gz)
sha256sums=('75c8d64e79c7a6afc509382afb5d1bebef6919bba62a4fa6fcb9cd3374ab1499')

prepare() {
  cd "${srcdir}/${_realname}-${pkgver}"

  # Disable Werror
  find /$(pwd) -type f -exec sed -i 's/-Werror//g' '{}' \;
}

build() {
  cd ${srcdir}/${_realname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_realname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
