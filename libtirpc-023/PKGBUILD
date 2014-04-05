# $Id$
# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libtirpc-023
_pkgname=libtirpc
pkgver=0.2.3
pkgrel=2
provides=("libtirpc=$pkgver")
conflicts=("libtirpc")
replaces=("libtirpc")
pkgdesc="Transport Independent RPC library (Kerberos/GSSAPI compatible version)"
arch=('i686' 'x86_64')
url="http://libtirpc.sourceforge.net/"
license=('BSD')
depends=('libgssglue')
backup=('etc/netconfig')
source=(http://downloads.sourceforge.net/sourceforge/libtirpc/${_pkgname}-${pkgver}.tar.bz2
       libtirpc-build.patch)

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -p1 <"$srcdir/libtirpc-build.patch"

  ./configure --prefix=/usr --sysconf=/etc --enable-gss

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
}
md5sums=('b70e6c12a369a91e69fcc3b9feb23d61'
         'd4c0eef2f0891abf06cd4146eb51ed36')
