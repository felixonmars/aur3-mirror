# Maintainer: Olli Laasonen <admin at laasonen dot net>

pkgname=srcds-launcher
pkgver=1.0.2
pkgrel=3
pkgdesc="Makes starting of srcds orangebox servers easier and faster."
url="http://aur.archlinux.org/packages.php?ID=38603"
install="srcds-launcher.install"
arch=('any')
license=('AGPL')
depends=('srcds')
source=(srcds-launcher srcds-launcher-config srcds-launcher.install)
md5sums=('ffac15de067414db16e2cf56d592f790' '9f3fc78c71459aaa92519c33c3c3f4fe' 'e248aea5a0e5398e329d848b8ed201aa')

build(){
	if [ -f $srcdir/$pkgname-$pkgver ]
	then
		echo "Deleting old build folder.."
		rm -R $srcdir/$pkgname-$pkgver
		echo ""
	fi
	echo "Preparing files.."
	mkdir $srcdir/$pkgname-$pkgver
	cd $srcdir/$pkgname-$pkgver
	chmod +x $srcdir/srcds-launcher
	chmod +x $srcdir/srcds-launcher-config
	echo ""
	echo "Coping files.."
	install -d $pkgdir/usr/bin
	install -d $pkgdir/opt/srcds/
	cp $srcdir/srcds-launcher $pkgdir/usr/bin/srcds-launcher
	cp $srcdir/srcds-launcher-config $pkgdir/opt/srcds/srcds-launcher-config
}
