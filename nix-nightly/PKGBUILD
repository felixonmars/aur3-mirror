# Maintainer: L42y <423300@gmail.com>
pkgname=nix-nightly
pkgver=1.0pre26784
_basename=nix
_pkgbuild=1041231
pkgrel=1
pkgdesc="Nix is a purely functional package manager. "
url="http://nixos.org/"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libxml2' 'libxslt' 'docbook-xsl' 'sqlite3' 'perl-dbi' 'perl-dbd-sqlite' 'gc')
source=(http://hydra.nixos.org/build/${_pkgbuild}/download/5/${_basename}-${pkgver}.tar.bz2)
md5sums=('7dfc7d2c348e12c263228dd6c059b75d')

build() {
 cd "${srcdir}/${_basename}-${pkgver}"
 ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-gc --with-store-dir=/var/nix/store
 make
}

package() {
 cd "${srcdir}/${_basename}-${pkgver}"
 make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
