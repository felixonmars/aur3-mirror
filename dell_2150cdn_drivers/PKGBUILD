# Contributor: Thomas Kinnen <thomas.kinnen@gmail.com>
pkgname=dell_2150cdn_drivers
provides="dell_2150cdn_drivers"
pkgdesc="Linux cups printer driver for Dell 2150cn/cdn Color Laser Printer"
url="http://ftp.dell.com/Pages/Drivers/dell-2150cn-cdn.html"
pkgver=1.0
pkgrel=1
arch=('i686' 'x86_64')
license=('custom')
depends=('cups')
makedepends=('rpmextract')
source=('http://ftp.dell.com/FOLDER00409836M/1/05_2150_SFP_Linux.zip')
md5sums=('30c54189a1832fc8caec89c04fad100b')

build() {
	cd $srcdir/Linux
    rpmextract.sh Dell-2150-Color-Printer-$pkgver-1.i686.rpm
    cp -r usr/ $pkgdir
}

