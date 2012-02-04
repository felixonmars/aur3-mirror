# Contributor: Changaco <changaco ατ changaco δοτ net>

pkgname=mp32ogg-bash
pkgver=0.2.1
pkgrel=1
pkgdesc="A bash script to convert mp3 files into ogg vorbis files"
url="http://changaco.net/code/$pkgname/"
arch=('any')
license=('GPL')
depends=('vorbis-tools' 'id3lib' 'mp3info' 'mpg123')
source=("$pkgname-$pkgver::http://changaco.net/code/$pkgname/$pkgname")
md5sums=('2c1a610c840af001a08db91aa3c2227b')

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -m 755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
