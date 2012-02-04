# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=k8048
pkgver=1.04
pkgrel=1
pkgdesc="Programs PIC microchips using the Velleman K8048 or K8076"
arch=('i686' 'x86_64')
url="http://dev.kewl.org/k8048/Doc"
license=('custom')
depends=('gputils')
source=("http://dev.kewl.org/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('6bead2b49d8d01818903ce54eaeb93f6')

build() {
  cd "$srcdir/$pkgname"
	make all
}

package() {
	# program data
	install -Dm 775 "$srcdir/$pkgname/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
	for link in k14 k16 kdebug ktest; do
		ln -s "/usr/bin/$pkgname" "$pkgdir/usr/bin/$link"
	done

	# license
	install -Dm 644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# documentation
	for file in cygwin.jpg K8048.jpg k8076.jpg; do
		install -Dm 644 "$srcdir/$pkgname/Images/$file" "$pkgdir/usr/share/doc/$pkgname/$file"
	done
	sed 's,../Images/,,g' "$srcdir/$pkgname/Doc/index.html" > "$pkgdir/usr/share/doc/$pkgname/index.html"
}
