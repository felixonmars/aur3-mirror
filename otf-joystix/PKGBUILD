pkgname=otf-joystix
pkgver=1
pkgrel=1
pkgdesc='A 10px bitmap font'
arch=('any')
url=http://typodermicfonts.com/
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=otf.install
source=(source.zip::http://img.dafont.com/dl/?f=joystix)
md5sums=('372f6635423054dcacbac15f3571bed3')

build()
{
	install -d "$pkgdir/usr/share/fonts/OTF"
	install -m644 "$srcdir"/*.otf "$pkgdir/usr/share/fonts/OTF"
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 "$srcdir"/*.pdf "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
	install -m644 "$srcdir"/*.html "$pkgdir/usr/share/licenses/$pkgname/README.html"
}
