# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=mobiperl
pkgver=0.0.43
pkgrel=1
pkgdesc="A collection of tools for handling MobiPocket files."
arch=('any')
url="http://www.mobileread.com/forums/showthread.php?t=17718"
license=('GPL')
depends=(
	'perl-gd'
	'perl-getopt-mixed'
	'perl-html-tree'
	'perl-image-bmp'
	'perl-image-size'
	'perl-p5-palm'
	'perl-timedate'
	'perl-xml-parser-lite-tree'
	'perl>=5.5.0'
)
options=('!emptydirs')
source=("https://dl.dropboxusercontent.com/u/24716740/mirror/$pkgname-$pkgver.tar")
md5sums=('39a7c5d416ff34e7572881fd35df9368')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p "$pkgdir/usr/share/perl5/vendor_perl"
	cp -r "Palm" "MobiPerl" "$pkgdir/usr/share/perl5/vendor_perl"

	mkdir -p "$pkgdir/usr/bin"
	for file in 'html2mobi' 'lit2mobi' 'mobi2html' 'mobi2mobi' 'mobils' 'opf2mobi'; do
		cp "$file" "$pkgdir/usr/bin"
	done

	mkdir -p "$pkgdir/usr/share/$pkgname"
	for file in 'mobi2mobi' 'mobils' 'mobi2html' 'lit2mobi' 'opf2mobi' 'html2mobi'; do
  	pod2html "$file" > "$pkgdir/usr/share/$pkgname/$file.html"
	done
}
