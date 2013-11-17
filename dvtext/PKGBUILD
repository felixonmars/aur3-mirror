# dvtext packaging script for ArchLinux - Copyright (c) 2013 Pierre Choffet

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

pkgname=dvtext
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Render DV movies of titles and scrolling credits "
arch=('i686', 'x86_64')
url="http://www.davidsimmons.com/soft/dvtext/"
license=('GPL2')
groups=()
depends=('libdv' 'freetype2')
makedepends=('freetype2')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog="ChangeLog"
source=("http://www.davidsimmons.com/soft/$pkgname/$pkgname-$pkgver.tar.gz"
"http://www.davidsimmons.com/soft/dvtext/dvtext-pal_8bit.diff")
noextract=()
md5sums=('a94300fd29a08bfff7b8f510400c02f9'
'41c4811e16e95b6d47d6b197292c2a14')

build() {
	cd $srcdir
	patch -p0 < dvtext-pal_8bit.diff

	cd $pkgname
	make
}

package() {
	cd $srcdir/$pkgname
	mkdir -p $pkgdir/usr/bin/
	cp dvtext $pkgdir/usr/bin/

	mkdir -p $pkgdir/usr/share/$pkgname
	cp example-credits.dvt $pkgdir/usr/share/$pkgname
	cp example-title.dvt $pkgdir/usr/share/$pkgname
	cp README $pkgdir/usr/share/$pkgname
	cp COPYRIGHTS $pkgdir/usr/share/$pkgname
}
