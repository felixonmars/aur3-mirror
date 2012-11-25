# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
# Contributor: Kenjy <kenjyx@gmail.com>

pkgname=dpgconv
pkgver=10.1
pkgrel=1
pkgdesc="Video converter tool for Nintendo DS"
arch=('i686' 'x86_64')
url="http://theli.is-a-geek.org/blog/static/dpgconv"
license=('GPL')
depends=('python2' 'mplayer' 'mpeg_stat' 'mencoder')
source="http://pypi.python.org/packages/source/d/${pkgname}/${pkgname}-${pkgver}.tar.gz"
md5sums=('1a0462e326d69d9beabde60ed5a4e9b2')

build(){
	# Python2 fix
	cd ${srcdir}/${pkgname}-${pkgver}
	install -m755 -D $srcdir/${pkgname}-${pkgver}/${pkgname} $pkgdir/usr/bin/${pkgname}
	sed -i "s|\(usr/bin/env python\).*|\12|" $pkgdir/usr/bin/${pkgname}
	
}
