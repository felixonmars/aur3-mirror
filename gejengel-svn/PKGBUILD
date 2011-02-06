# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Alois Nespor <alois.nespor@gmail.com>

pkgname=gejengel-svn
pkgver=410
pkgrel=1
pkgdesc="An audio player which focuses on performance and simplicity"
arch=('i686' 'x86_64')
url="http://gejengel.googlecode.com/svn/trunk/web/index.html"
license=('GPL')
depends=('libsexymm' 'taglib' 'libnotify' 'imagemagick' 'alsa-lib' 'lastfmlib' 'libmad' 'flac' 'libxdg-basedir')
source=()
md5sums=()

_svntrunk=http://gejengel.googlecode.com/svn/trunk/
_svnmod=gejengel

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

  #
  # BUILD
  #
  ./autogen.sh

  ./configure --prefix=/usr || return 1
  make || return 1
}
package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir" install || return 1
}
