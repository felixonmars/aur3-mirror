# Contributor: LTSmash <lord.ltsmash@gmail.com>
# Updated by: Anonymo <meowdib at gmail.com>
pkgname=libsalsa
pkgver=4.2
pkgrel=1
pkgdesc="ALSA emulation library for OSSv4 (libasound replacement)"
arch=(i686 x86_64)
url="http://www.4front-tech.com/"
license=('GPL')
depends=(oss)
provides=(libasound)
conflicts=(alsa-lib)
install=
source=(http://www.4front-tech.com/developer/sources/stable/gpl/oss-v4.2-build2003-src-gpl.tar.bz2
	patch.diff)
md5sums=('d5bcdc505f5ad140791b8d0051fda74d'
	 'e772501e4f0fdeaef4b6656f4d955f82')

build() {
  cd "$srcdir/oss-v4.2-build2003-src-gpl/lib/libsalsa"  
  patch $srcdir/oss-v4.2-build2003-src-gpl/lib/libsalsa/Makefile $srcdir/patch.diff
  make || return 1
  make DESTDIR="$pkgdir" install
} 
