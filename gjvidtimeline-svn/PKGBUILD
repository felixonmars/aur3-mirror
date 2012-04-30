# Maintainer: David Adler <david dot jo dot adler at gmail dot com>
pkgname=gjvidtimeline-svn
pkgver=16
pkgrel=1
pkgdesc="displays video as a timeline of frames in sync with JACK Transport"
arch=('x86_64' 'i686')
url="http://gjvidtimeline.sourceforge.net/"
license=('GPL')
depends=('lash' 'liblo' 'ffmpeg')
makedepends=('subversion')
_svntrunk=https://gjvidtimeline.svn.sourceforge.net/svnroot/gjvidtimeline/trunk
_svnmod=gjvidtimeline


build() {

  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}
