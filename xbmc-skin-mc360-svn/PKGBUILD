# Contributor: Juan Moreno <juan@archlinux.us>
pkgname=xbmc-skin-mc360-svn
pkgver=2113
pkgrel=1
pkgdesc="An XBMC skin that resembles the Xbox 360's Dashboard"
url="http://blackbolt.x-scene.com/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('xbmc')
makedepends=('subversion')
conflicts=()
provides=()
source=()
md5sums=()

_svntrunk=https://svn.sourceforge.net/svnroot/xboxmediacenter/MC360
_svnmod=MC360

build() {
	cd $startdir/src
	
	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  cd $_svnmod

	sh Build.sh
	cd BUILD
	install -d -m 755 $pkgdir/usr/share/xbmc/skin
	cp -r $_svnmod $pkgdir/usr/share/xbmc/skin
}

