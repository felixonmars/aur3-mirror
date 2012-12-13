# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=ephysics-svn
pkgver=80891
pkgrel=1
pkgdesc="A wrapper between Bullet Physics and EFL"
arch=('i686' 'x86_64')
url="http://brunodilly.org/blog/ephysics/"
license=('BSD2')
depends=('ecore' 'bullet')
makedepends=('subversion')
conflicts=('ephysics')
provides=('ephysics')
options=('!libtool')

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/ephysics"
_svnmod="ephysics"

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

  ./autogen.sh --prefix=/usr

  make
}

package(){
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/$_svnmod-build/COPYING" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 "$srcdir/$_svnmod-build/AUTHORS" \
        "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"

  rm -r "$srcdir/$_svnmod-build"
}
