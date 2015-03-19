# Maintainer: Jessse Kennedy <jgkenne@clemson.edu>

pkgname=bjnplugin
pkgver=2.90.553.5
pkgrel=1
pkgdesc="A Firefox plugin for BlueJeans, a web-based video conferencing application"
arch=('x86_64')
url="http://bluejeans.com/"
license=('unknown')
source=("https://swdl.bluejeans.com/skinny/bjnplugin_2.90.553.5-1.x86_64.rpm")
md5sums=("3a990fb60c1b939cc23df8ca349b6cde")


package() {
	install -d "$srcdir"/usr/lib64/mozilla/plugins/.* "$pkgdir"/usr/lib/mozilla/plugins/.bjnplugin
	install -D "$srcdir"/usr/lib64/mozilla/plugins/* "$pkgdir"/usr/lib/mozilla/plugins/
} 
