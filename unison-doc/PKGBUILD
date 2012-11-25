# Maintainer: Ruslan Nabioullin <rnabioullin at gmail dot com>
pkgname=unison-doc
pkgver=2.40.65
pkgrel=1
pkgdesc="Offline documentation for unison"
arch=('any')
url="http://www.seas.upenn.edu/~bcpierce/unison"
license=('GPL3')
source=("$url/download/releases/unison-$pkgver/unison-$pkgver-manual.html"
    "$url/download/releases/unison-$pkgver/unison-$pkgver-manual.pdf"
    "$url/download/releases/unison-$pkgver/unison-$pkgver-manual.ps")
md5sums=('eaab3c6eab3c9e5ae033437209afc4a4'
    'd772fcff83a0fa4fe873512eb9f25499'
    '30c80f2b1d9264aedf8b3abeb92e08bd')

package() {
    install -D -m 644 $srcdir/unison-$pkgver-manual.html \
	$pkgdir/usr/share/doc/unison/manual.html
    install -D -m 644 $srcdir/unison-$pkgver-manual.pdf \
	$pkgdir/usr/share/doc/unison/manual.pdf
    install -D -m 644 $srcdir/unison-$pkgver-manual.ps \
	$pkgdir/usr/share/doc/unison/manual.ps
}
