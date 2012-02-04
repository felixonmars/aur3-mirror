# Contributor: Vithon <ratm@archlinux.us>

pkgname=dirogg
pkgver=0.4
pkgrel=2
pkgdesc="Dirogg is a script to automatically migrate your music collection to the Ogg Vorbis format."
arch=('any')
license=('GPLv2')
depends=('lame' 'vorbis-tools' 'id3lib')
url="http://home.student.uu.se/frli4865/software.php"
source=("http://home.student.uu.se/frli4865/sw/dirogg-0.4.tar.gz")
md5sums=('70b4f4ede0f492c9efeb9822a19bcd50')

build() {
	install -D -m775 $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/bin/${pkgname}
	install -D -m664 $srcdir/$pkgname-$pkgver/$pkgname.conf $pkgdir/etc/${pkgname}.conf
}
