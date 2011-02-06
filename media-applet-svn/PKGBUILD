# Contributor: Michail "mnk" Pavlenko <maniak.net [at] gmail [dot] com>
pkgname=media-applet-svn
pkgver=53
pkgrel=2     
pkgdesc="A gnome applet to easily mount/unmount removable media based on ejecter(0.0.9) project. SVN version."
arch=('i686' 'x86_64')
url="http://live.gnome.org/media-applet"
license=('GPL3')
depends=('vala' 'python' 'gtk2')
makedepends=('subversion')
conflicts=('media-applet')
source=()
md5sums=()

_svntrunk=http://media-applet.googlecode.com/svn/trunk
_svnmod=media-applet-svn

build() {

  cd $startdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $_svnmod
  ./waf configure --prefix=/usr
  ./waf
  ./waf install --destdir="$pkgdir"
}
