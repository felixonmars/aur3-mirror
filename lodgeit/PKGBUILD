# Maintainer: Stefan J. Betz <info@stefan-betz.net>

pkgname=lodgeit
pkgver=0.3
pkgrel=3
pkgdesc="Pastes text files to http://paste.pocoo.org/"
depends=('python2')
optdepends=('xclip: to paste URLs to the clipboard')
arch=('any')
license=('GPL')
url="http://paste.pocoo.org/help/integration/"
source=(http://dev.pocoo.org/hg/lodgeit-main/raw-file/22a108f3aa85/scripts/lodgeit.py
	python2.patch)
md5sums=('fad67c6e59ccdae6e2f489d4709213d6'
         'b45c86578ff6264fd1da9cb400fd7812')

build() {
	patch $srcdir/lodgeit.py $srcdir/python2.patch
	install -D -m755 $srcdir/lodgeit.py $pkgdir/usr/bin/lodgeit
}
