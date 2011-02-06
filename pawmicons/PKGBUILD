#Maintainer: Shoeunited shoeunited@gmail.com
#Contributor: V.V Phansalkar vvphansi@yahoo.co.in
pkgname=pawmicons
pkgver=0.1.9
pkgrel=2
pkgdesc="Python script to create and configure PAWM icons on your screen in an easy way."
url="http://www.pleyades.net/pawm/utilities.php"
license=('GPL2')
arch=('x86' 'x86_64')
depends=('tcl' 'tix')
source=(http://www.pleyades.net/pawm/utils/pawmIcons-0.1.9.tar.bz2)
md5sums=('053007372e33c238af0e195c0e3dbff9')
build() {
cd $srcdir/pawmIcons-$pkgver/
sed -i '1,7d' Constraints
sed -i 's|/usr/local/lib/pawm/icons|/usr/share/pawm/icons|' pawmIcons.py
install -D Constraints $pkgdir/usr/share/pawmicons/Constraints
install -D -m 0755 pawmIcons.py $pkgdir/usr/bin/pawmIcons.py
}

