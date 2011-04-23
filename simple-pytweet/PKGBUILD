# Contributor: Zerial <fernando@zerial.org>
pkgname=simple-pytweet
pkgver=0.1
pkgrel=1
pkgdesc="Publish on twitter what are you doing using a simple interface"
arch=('i686' 'x86_64')
url="http://dev.zerial.org/simple-pytweet"
license=('GPL')
depends=('xdialog' 'python-twitter' 'pyzenity' )
source=(http://dev.zerial.org/simple-pytweet/${pkgname}_${pkgver}.tar.gz)
md5sums=('d84220028af81f3d7281aa9acf7c941d')

build(){
	cd $startdir/src/${pkgname}_${pkgver}
	install -d $startdir/pkg/usr/local/share/${pkgname}_${pkgver}
	mkdir $startdir/pkg/usr/bin
	install -m744 $startdir/src/${pkgname}_${pkgver}/simple-pytweet.conf $startdir/pkg/usr/local/share/${pkgname}_${pkgver}/
	install -m755 $startdir/src/${pkgname}_${pkgver}/simple-pytweet.py $startdir/pkg/usr/bin/
	chmod +x $startdir/pkg/usr/bin/simple-pytweet.py
}
