# Maintainer: epaaj <epaaj@ninjaloot.se>
# Contributor: Dgellow <georgesleyetidoux@gmail.com>
# Contributor: Jookia <166291@gmail.com>
pkgname=shoresofhazeron
pkgver=20121207
pkgrel=2
pkgdesc="Shores of Hazeron is an ambitious and revolutionary game of science fiction adventure, intrigue, and war."
arch=(i686 x86_64)
url="http://www.hazeron.com/"
install="shoresofhazeron.install"
license=(custom)
depends=(freealut libpng12)

source=(http://www.hazeron.com/software/ShoresOfHazeron32ub12.tar.gz
	shoresofhazeron)
md5sums=('fc46974b50cb72d0721c6cf1de7c6efb'
	'40f220b26795c20e67f13f8a394e3655')

if [[ $CARCH == 'x86_64' ]]; then
	source=(http://www.hazeron.com/software/ShoresOfHazeron64ub12.tar.gz
		shoresofhazeron)
	md5sums=('8cb6e3372cbe410c12999b210f4436cc'
		'40f220b26795c20e67f13f8a394e3655')
fi

build()
{
	install -d $pkgdir/opt/Shores\ of\ Hazeron
	cp -r $srcdir/Shores\ of\ Hazeron $pkgdir/opt
	
	install -Dm755 $srcdir/shoresofhazeron $pkgdir/usr/bin/shoresofhazeron
	
	chown -R :games $pkgdir/opt/Shores\ of\ Hazeron
	chmod -R g+rwX $pkgdir/opt/Shores\ of\ Hazeron
}
