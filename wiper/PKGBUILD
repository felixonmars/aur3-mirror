# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=wiper
pkgver=3.5
pkgrel=1
pkgdesc="script from hdparm for tuning up SATA SSDs"
arch=('i686' 'x86_64')
license=('GPL2')
url=("http://sourceforge.net/projects/hdparm")
source=("http://sourceforge.net/projects/hdparm/files/${pkgname}.sh-${pkgver}.tar.gz")
install="wiper.install"
md5sums=('c599e76db27361152a010387bd432df0')


package() {
	cd $srcdir/$pkgname-$pkgver
	
	install -d $pkgdir/usr/{bin,share/$pkgname}
	install -Dm644 README.txt $pkgdir/usr/share/$pkgname/README.txt
	install -Dm755 wiper.sh $pkgdir/usr/bin/wiper
}
