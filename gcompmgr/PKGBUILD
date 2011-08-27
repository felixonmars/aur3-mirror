pkgname=gcompmgr
pkgver=0.21
pkgrel=1
pkgdesc="Graphical front end for xcompmgr"
_pkgnum=1mdk10_2
arch=(any)
license=('unknown')
url='http://sourceforge.net/projects/gcompmgr/'
depends=('xcompmgr' 'gtk2')
makedepends=('rpmextract')
source=(http://superb-sea2.dl.sourceforge.net/project/gcompmgr/gcompmgr/${pkgname}-${pkgver}-${_pkgnum}.i586.rpm/${pkgname}-${pkgver}-${_pkgnum}.i586.rpm)
md5sums=('079f46b9b7177b723b28819fed4f8ff9')

build() {
	cd ${pkgdir}
	rpmextract.sh ../src/${pkgname}-${pkgver}-${_pkgnum}.i586.rpm
}
