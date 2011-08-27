# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=bluemindo-svn
pkgver=124
pkgrel=1
pkgdesc="A really simple but powerful audio player, using PyGTK & GStreamer"
arch=('any')
url="http://bluemindo.codingteam.net/"
license=('GPL3')
depends=('pygtk>=2' 'gstreamer0.10-python' 'tagpy')
makedepends=('make' 'subversion')
provides=('bluemindo')
conflicts=('bluemindo')
optdepends=('dbus-python: Notifications support'
            'python-notify: Notifications support'
            'python-pyxmpp: PEP Plugin')

_svntrunk="http://svn.codingteam.net/bluemindo/trunk"
_svnmod="bluemindo"

build() {
  msg "Connecting to SVN server..."

  [ -d $_svnmod ] && {
    cd $_svnmod
    svn up -r $pkgver
    cd ..
    msg "Local files have been updated."
  } || {
    svn co $_svntrunk $_svnmod -r $pkgver --config-dir ./
  }

  msg "SVN checkout done or server timeout"

  rm -rf $_svnmod-build
  cp -rf $_svnmod/ $_svnmod-build/
  cd $_svnmod-build

  msg "Starting make..."

  mkdir -p "$pkgdir"/usr/share/{applications,man,pixmaps}
  make DESTDIR="$pkgdir" install
}
