# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=patchage
pkgname=$_pkg-svn
pkgver=3852
pkgrel=1
pkgdesc="A modular patch bay for audio and MIDI systems."
arch=(i686 x86_64)
url="http://drobilla.net/software/$_pkg/"
license=('GPL')
depends=('ganv' 'jack' 'dbus-glib' 'hicolor-icon-theme')
makedepends=('subversion' 'python2' 'boost')
install=("$pkgname.install")
provides=("$_pkg=0.6.0")
conflicts=("$_pkg")

_svntrunk=http://svn.drobilla.net/lad/trunk/$_pkg
_svnmod=$_pkg

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

  # remove ldconfig
  sed -i "/ldconfig/d" wscript

  python2 waf configure --prefix=/usr \
                        --mandir=/usr/share/man
  python2 waf
}

package() {
  cd "$srcdir/$_svnmod-build"

  DESTDIR="$pkgdir/" python2 waf install
}
