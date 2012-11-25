# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=ecore-svn
pkgver=79439
pkgrel=1
pkgdesc="Core mainloop, display abstraction and utility library in EFL"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('efl-svn' 'libxp' 'curl' 'libxss' 'libxtst' 'libxcomposite' 
	 'libxinerama' 'libxcursor')
makedepends=('subversion')
conflicts=('ecore')
provides=('ecore')
options=('!libtool' '!emptydirs')

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/ecore"
_svnmod="ecore"

build() {
  cd "$srcdir"

  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  ./autogen.sh --prefix=/usr \
	--enable-openssl \
	--disable-gnutls \

  make
}

package(){
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir" install
 
# install license files
  install -Dm644 "$srcdir/$_svnmod-build/COPYING" \
	"$pkgdir/usr/share/licenses/$pkgname/COPYING"

  install -Dm644 "$srcdir/$_svnmod-build/AUTHORS" \
	"$pkgdir/usr/share/licenses/$pkgname/AUTHORS"

  rm -r "$srcdir/$_svnmod-build"
}
