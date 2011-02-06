# Maintainer:tong <piggy1983@163.com>

pkgname=stardict-wikipedia-zhwiki
pkgver=2.4.2
pkgrel=1
pkgdesc="Wikipedia dictionary for Stardict"
license=('GPL')
depends=('stardict')
url="http://stardict.sourceforge.net"
md5sums=('d4af43e9d7ff02fdd88f7e57bf60c1a9')
source=(http://ftp.heanet.ie/pub/sourceforge/s/project/st/stardict/stardict-dict-WikiPedia/${pkgver}/${pkgname}-${pkgver}.tar.bz2)    
arch=('any')

build() {
	cd $srcdir/${pkgname}-${pkgver}
	
	INSTALLDIR=/usr/share/stardict/dic
	mkdir -p $pkgdir$INSTALLDIR
	mv *  $pkgdir$INSTALLDIR/
}
