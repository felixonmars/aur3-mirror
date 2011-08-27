pkgname=xbmc-skin-refocus
pkgver=0.9.1
pkgrel=1
pkgdesc="reFocus skin for XBMC"
arch=('i686' 'x86_64')
url='http://code.google.com/p/xbmc-focus/'
source=("http://xbmc-focus.googlecode.com/files/reFocus.PR2-${pkgver}.zip")
makedepends=('unzip')
depends=('xbmc')
provides=()
groups=('multimedia')
license=('GPL')
options=()

build() {
	#Copy tree to share location
	mkdir -p "$pkgdir/usr/share/xbmc/addons"
	cp -r "$startdir/src/skin.refocus" "$pkgdir/usr/share/xbmc/addons"
}

md5sums=('4afe495a813ed52aa699d6f68805b296')
md5sums=('2ddf9aa78e29693ca3406e93837890cd')
