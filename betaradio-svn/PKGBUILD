# Contributor : Yanganto <yanganto@gmail.com>
# Maintainer : Daniel YC Lin <dlin.tw at gmail>

pkgname=betaradio-svn
pkgver=217
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
pkgdesc="An easy way to listen to internet radio of Taiwan."
url="http://code.google.com/p/betaradio/"
depends=('gtk2' 'json-glib' 'libsoup' 'gstreamer0.10' 'hicolor-icon-theme' 'libltdl')
optdepends=('gstreamer0.10-plugins')
makedepends=('subversion'  'vala')
source=('repo::svn+http://betaradio.googlecode.com/svn/trunk')
md5sums=('SKIP')
install=betaradio.install

pkgver() {
  cd repo
  svnversion | tr -d [A-z]
}

build() {
  cd repo
  sed -i "s/-Werror //" configure.ac
  autoreconf -i -f
  ./configure --prefix=$pkgdir/usr
  make
}

package() {
  cd repo
  make install
  rmdir $pkgdir/usr/lib $pkgdir/usr/include
}
# vim:et sw=2 ts=2 ai
