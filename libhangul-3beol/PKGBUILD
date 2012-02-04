# $Id$
# Contributor: damir <damir@archlinux.org>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=('libhangul-3beol')
_pkgname=libhangul
pkgver=0.1.0
pkgrel=1
pkgdesc='Input method library for Korean'
arch=('i686' 'x86_64')
url='http://code.google.com/p/libhangul/'
license=('LGPL')
groups=()
depends=()
makedepends=()
optdepends=()
replaces=()
backup=()
options=('!libtool')
install=
changelog=
DLAGENTS=("http::/usr/bin/curl -A '' -fLC - --retry 3 --retry-delay 3 -o %o %u") # moronic httpd bans curl's user-agent
source=("http://libhangul.googlecode.com/files/libhangul-0.1.0.tar.gz"
		"00_2011.11.23.patch"
		"05_3beol.patch")
noextract=()
sha1sums=('9c6f3a82f2d4068771215f1b9f13a0d4bdbbfc77'
          '34c968a8a3440f32878499382bd3bfb90a047d59'
          'aaa86d1ec4872f86e8d0e55615f3f42a1831e34f')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -Np1 -i "${srcdir}/00_2011.11.23.patch"
	patch -Np1 -i "${srcdir}/05_3beol.patch"

	./configure --prefix=/usr --enable-static=no
	make
}

package_libhangul-3beol() {
  pkgdesc=("Input method library for Korean."
		"수정 신세벌식 (2003박경남)"
		"안마테(2009)"
		"두벌식 드보락"
		"세벌식 최종 드보락")
  depends=()
#  install=$_pkgname.install
  optdepends=()
  provides=('libhangul')
  conflicts=('libhangul')
	
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
