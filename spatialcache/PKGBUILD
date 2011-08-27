# 
pkgname=spatialcache
pkgver=0.5.2
pkgrel="0"
pkgdesc="A very simple python wms cache server"
arch=('i686' 'x86_64')
license=('GPL')
url="http://code.google.com/p/spatialcache/"
groups=('spatialcache')
depends=('python')
source=( http://spatialcache.googlecode.com/files/spatialcache-${pkgver}.tar.gz
	 http://spatialcache.googlecode.com/files/spatialcache.install )
backup=(ect/spatialcache/configuration.xml)
md5sums=('1800e7a53427529cce1a41e84e29326a'
	 '424e8c7f27166e4f52c9b1b0461ebcf4')
install=spatialcache.install

build() {
	mkdir -p ${pkgdir}/usr/share/spatialcache
	mkdir -p ${pkgdir}/etc/spatialcache/
	cp -r spatialcache/* ${pkgdir}/usr/share/spatialcache
	cp spatialcache/configuration.xml ${pkgdir}/etc/spatialcache/
	sed -i "s/help/\/usr\/share\/spatialcache\/help/" ${pkgdir}/usr/share/spatialcache/constants/general.py
}
