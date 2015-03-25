# Maintainer:  John Schoenick <john@pointysoftware.net>
# Contributor: Geoffrey Teale <tealeg@googlemail.com>
pkgname=lib32-google-breakpad-svn
epoch=1 # Due to pre-VCS version not including the 'r'
pkgver=r1435
pkgrel=1
pkgdesc="An open-source multi-platform crash reporting system"
arch=('x86_64')
url="http://code.google.com/p/google-breakpad/"
license=('BSD')
depends=('google-breakpad-svn' 'lib32-gcc-libs')
makedepends=('subversion' 'gcc-multilib')

_svnname="google-breakpad-svn"
source=("${_svnname}::svn+https://google-breakpad.googlecode.com/svn/trunk")
sha1sums=('SKIP')

options=('staticlibs' '!strip')

pkgver() {
  cd "$_svnname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir"

  rm -rf "${pkgname}-build"
  svn export "$_svnname" "${pkgname}-build"
  cd "${pkgname}-build"

  msg2 "Running autotools"
  autoreconf -v --force --install
  msg2 "Configuring"
  ./configure --enable-m32 --program-suffix=-32 \
	      --prefix=/usr --libdir=/usr/lib32
  msg2 "Building"
  make
}

package() {
  cd "$srcdir/$pkgname-build"
  make DESTDIR="$pkgdir" install
  mv "${pkgdir}/usr/share/doc/breakpad-0.1" "${pkgdir}/usr/share/doc/breakpad32-0.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  # Depends on non-lib32 package for these
  rm -rf "${pkgdir}/usr/include"
}
