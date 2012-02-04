# Contributor: tri1976
pkgname=googsystray-svn
pkgver=354
pkgrel=1
pkgdesc="Googsystray is a system tray app for Google Voice, GMail, Google Calendar, and Google Reader"
arch=("i686")
url="http://googsystray.sourceforge.net"
license=('GPL3')
depends=('python2' 'pygtk')
makedepends=('subversion')
provides=("googsystray")
conflicts=("googsystray")
replaces=("googsystray")

_svntrunk=https://googsystray.svn.sourceforge.net/svnroot/googsystray/trunk
_svnmod=googsystray

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
  python2 setup.py install --root="${pkgdir}"
  install -D -m644 LICENSES "$pkgdir/usr/share/licenses/$pkgname/LICENSES"
}
