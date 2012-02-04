# Maintainer: Ruslan Nabioullin <rnabioullin at gmail dot com>
pkgname=fhs
pkgver=2.3
pkgrel=1
pkgdesc="Filesystem Hierarchy Standard (FHS) Documentation"
url="https://wiki.linuxfoundation.org/en/FHS"
license=('custom')
source=("http://refspecs.linuxfoundation.org/FHS_$pkgver/$pkgname-$pkgver.pdf"
        "http://refspecs.linuxfoundation.org/FHS_$pkgver/$pkgname-$pkgver.ps.gz"
	"http://refspecs.linuxfoundation.org/FHS_$pkgver/$pkgname-$pkgver.txt.gz"
	"http://refspecs.linuxfoundation.org/FHS_$pkgver/$pkgname-$pkgver.html")
md5sums=('e0a11e1fbc6cbb54f317f15691505187'
         '0f3c2ba243e819cb8ee69e59860d7ad9'
	 '786b867c223e9b925c3be5c92690008f'
	 'af0b7bdf1fbb9369099361d43f073d8c')
arch=('any')

package() {
    mkdir -p $pkgdir/usr/share/doc/fhs
    install -m 644 $srcdir/$pkgname-$pkgver.pdf $pkgdir/usr/share/doc/fhs
    install -m 644 $srcdir/$pkgname-$pkgver.ps $pkgdir/usr/share/doc/fhs
    install -m 644 $srcdir/$pkgname-$pkgver.txt $pkgdir/usr/share/doc/fhs
    install -m 644 $srcdir/$pkgname-$pkgver.html $pkgdir/usr/share/doc/fhs
}
