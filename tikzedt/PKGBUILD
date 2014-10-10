# Maintainer: Phil Schaf <flying-sheep@web.de>
pkgname=tikzedt
pkgver=0.2.2
pkgrel=2
pkgdesc='Semigraphical TikZ editor'
arch=('i686' 'x86_64')
url='http://tikzedt.org'
license=('GPL')
depends=('mono' 'texlive-latexextra')
makedepends=('graphicsmagick')
if [[ $CARCH == i686 ]]; then
	_debarch=x86
	_tarmd5='ec096e291543808ec70b207a72d37833'
else
	_debarch=amd64
	_tarmd5='594479b7fa39d30d31c688e104734e3d'
fi
source=("$pkgname-$pkgver.tgz::http://tikzedt.googlecode.com/files/TikzEdt_${pkgver//./_}_linux_$_debarch.tar.gz"
	'http://www.tikzedt.org/img/logotightorig.png'
	"$pkgname" "$pkgname.desktop")
md5sums=("$_tarmd5"
	'9ef023e0063836b4e2826f512798c8ae'
	'edabc95bb45b7e06419822d9815ee971'
	'6291d35a65c008cbfe832fa5fb5986ca')
noextract=("$pkgname-$pkgver.tgz")

package() {
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	for s in 16 22 32 48 64 128; do
		install -d "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/"
		gm convert "$srcdir/logotightorig.png" -resize "${s}x${s}" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/$pkgname.png"
	done
	install -d "$pkgdir/opt/$pkgname/"
	tar xvf "$srcdir/$pkgname-$pkgver.tgz" -C "$pkgdir/opt/$pkgname/"
}
