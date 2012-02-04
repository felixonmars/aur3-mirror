# Mantainer: Adria Arrufat <swiftscythe@gmail.com>
# Contributor: Ike Devolder <ike.devolder@gmail.com>
# Contributor: Daniel Hill <daniel.hill@orcon.net.nz>

pkgname=clementine-svn
pkgver=3258
pkgrel=1
pkgdesc="A modern music player and library organiser and a port of Amarok 1.4, with some features rewritten to take advantage of Qt4."
arch=('i686' 'x86_64')
url="http://code.google.com/p/clementine-player/"
license=('GPL')
depends=('gstreamer0.10' 'taglib' 'glew' 'liblastfm' 'libgpod' 'libmtp' 'libplist' 'hicolor-icon-theme' 'qt' 'libimobiledevice' 'libspotify' 'python2-pyqt')
optdepends=('gstreamer0.10-base-plugins: for more open formats'
            'gstreamer0.10-good-plugins: for use with "Good" plugin libraries'
            'gstreamer0.10-bad-plugins: for use with "Bad" plugin libraries'
            'gstreamer0.10-ugly-plugins: for use with "Ugly" plugin libraries')
makedepends=('subversion' 'boost' 'cmake' 'mesa')
provides=('clementine')
conflicts=('clementine')
source=()
md5sums=()

_svntrunk=http://clementine-player.googlecode.com/svn/trunk/
_svnmod="clementine-clean"

build() {
      FAIL=0
      if [ -d $_svnmod/.svn ]; then
          cd $_svnmod/
          svn update
          cd ../
      else
        svn co $_svntrunk $_svnmod
      fi
      msg "SVN checkout done or server timeout"
      msg "Starting make..."

      cp -r $_svnmod $_svnmod-build
      cd $_svnmod-build/
          cd bin/
          cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBUILDBOT_REVISION=$pkgver
          make && make DESTDIR=${pkgdir} install; FAIL=$?
          cd ..
      rm -rf ${srcdir}/$_svnmod-build
      return $FAIL
      
  }
