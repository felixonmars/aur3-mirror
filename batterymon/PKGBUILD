#Maintainer: Jarek Sedlacek <jareksedlacek@gmail.com>
pkgname=batterymon
pkgver=1.2.0
pkgrel=11
pkgdesc="A simple battery monitor ideal for openbox etc"
arch=('i686' 'x86_64') 
url="http://code.google.com/p/batterymon/"
license=('GPL2')
depends=('python2' 'hal' 'dbus-python' 'pygtk')
builddepends=('sed')
optdepends=('python-notify')
source=(http://batterymon.googlecode.com/files/batterymon-$pkgver.tar.gz http://jsedlacek.co.cc/remaining_time.patch)
build() {
	cd "$srcdir/batterymon"
	patch -p0 < ../remaining_time.patch 
}	

package(){

	cd "$srcdir/batterymon"
 	mkdir -p "$pkgdir/usr/share/batterymon" 
	mkdir -p "$pkgdir/usr/bin/" 
	cp -a ./ "$pkgdir/usr/share/batterymon/" 
	sed -i "$pkgdir/usr/share/batterymon/batterymon.py" -e '1d' -e '2i#!/usr/bin/env python2'
	find "$pkgdir/usr/share/batterymon/icons" -depth -name ".svn" -type d -exec rm -rf {} \; 
	ln -sf /usr/share/batterymon/batterymon.py "$pkgdir/usr/bin/batterymon" 
   
}

md5sums=('23bcd745daf5508005284ebd61c29c2b'
         'b6c881c9805c50ea29c7b7568c3b3384')
