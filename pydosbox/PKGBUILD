# Maintainer: roughl 
pkgname=pydosbox
pkgver=0.1.0
pkgrel=2
pkgdesc="A frontend of the DOSBox emulator. The program is still in alpha stage but usable."
arch=('any')
url="http://www.panayotis.com/prog/scripts/pydosbox"
license=('GPL')
groups=('emulators')
depends=('dosbox' 'python2' 'pygtk>=2.0')
source=(
"http://www.panayotis.com/files/pydosbox/$pkgname-$pkgver.tar.gz"
"python2.patch"
)
md5sums=('cc52070c97788a7f0d4cd515aaada7e0'
         'b3e2c73a8077feb68b422579e3d01386')

build() {
	cd "$srcdir"
	patch -p0 < python2.patch
}

package() {
	install -d $pkgdir/usr/bin
	install -D $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/bin/
}

# vim: ts=4 sw=4

