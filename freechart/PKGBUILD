# Maintainer: kso <keansum AT gmail DOT com>

pkgname=freechart
pkgver=r3169
pkgrel=1
pkgdesc="Free powerful charting library based on wxWidgets."
arch=('x86_64' 'i686')
url="http://wxcode.sourceforge.net/components/freechart/"
license=('custom:"wxWindows"')
depends=('wxgtk')
makedepends=('subversion')
source=('svn+http://svn.code.sf.net/p/wxcode/code/trunk/wxCode/components/freechart/')
md5sums=('SKIP')

_svntrunk=http://svn.code.sf.net/p/wxcode/code/trunk/wxCode/components/freechart/
_svnmod=freechart

pkgver() {
  cd "$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."
  msg $_svnmod

  if [[ -d "$_svnmod/.svn" ]]; then
    msg "a\n"
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    msg "b\n"
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install

  # install LICENSE
  install -D -m644 $srcdir/$pkgname/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
