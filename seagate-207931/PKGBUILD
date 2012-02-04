# Contributor: Yoschi <brain_hack [at] gmx [dot] de>
pkgname=seagate-207931
pkgver=3
pkgrel=1
pkgdesc="Check if your system uses disks affected by Seagate KB #207931"
url="http://ge.mine.nu/seagate-207931.html"
depends=('hdparm')
arch=('i686' 'x86_64')
license=('GPLv2')

source=(http://ge.mine.nu/code/seagate-207931-$pkgver.sh)
	
md5sums=('9ad6e92eff63b3541e1600fc9af45782') 

build(){
        chmod +x ./seagate-207931-$pkgver.sh
	mkdir $pkgdir/bin
	mv ./seagate-207931-$pkgver.sh $pkgdir/bin/seagate-207931
}
