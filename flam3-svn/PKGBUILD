# Contributor: totoloco <totoloco at gmail dot com>
pkgname=flam3-svn
pkgver=164
pkgrel=1
epoch=1
pkgdesc="Fractal Flames are algorithmically generated images and animations"
arch=("i686" "x86_64")
url="http://flam3.com/"
license=('GPLv2')
depends=('expat' 'libjpeg' 'libpng')
makedepends=('subversion')
conflicts=('electricsheep<2.7' 'flam3')
provides=('flam3')

source=()
md5sums=()

_svntrunk="http://flam3.googlecode.com/svn/trunk/"
_svnmod="flam3"

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
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build/src"

  ./configure --prefix=/usr
  if [ ! -d m4 ]; then
    libtoolize --copy --force
  fi
  make
}

package() {
  cd "$srcdir/$_svnmod-build/src"
  make install DESTDIR="$pkgdir"
}
