# Maintainer: Gregor Robinson <gregor@fiatflux.co.uk>
# Contributor: danielpublic <daniel at belagg dot nu>

pkgname=gnupg-pkcs11-scd-git
_gitname=gnupg-pkcs11-scd
pkgver=d8fe164
pkgrel=1
pkgdesc="A smart-card daemon to enable the use of PKCS11 tokens with GnuPG."
url="http://gnupg-pkcs11.sourceforge.net/"
license=("BSD")
depends=('pkcs11-helper' 'libgpg-error' 'libassuan' 'libgcrypt')
arch=('arm' 'i686' 'x86_64')
conflicts=('gnupg-pkcs11-scd')
provides=('gnupg-pkcs11-scd')
source=('git+https://github.com/alonbl/gnupg-pkcs11-scd.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  libtoolize
  aclocal
  autoheader
  automake --add-missing
  autoreconf -v
  ./configure --prefix=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR="${pkgdir}" install
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
  install -Dm644 COPYING* "${pkgdir}/usr/share/licenses/${pkgname}/"
}
