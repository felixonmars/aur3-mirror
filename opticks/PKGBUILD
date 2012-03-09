#Contributor: Flamelab <panosfilip@gmail.com>

pkgname=opticks
_realname=Opticks
pkgver=4.8.0
pkgrel=0
pkgdesc="An expandable remote sensing and imagery analysis software platform"
url="http://opticks.org/"
depends=('qt' 'openssl098' 'libgl' 'freetype2' 'libxcursor' 'libjpeg6' 'libxinerama')
arch=('x86_64')
source=(http://opticks.org/downloads//opticks/$pkgver/opticks-$pkgver-2.$CARCH.rpm
        qt.conf)
license=(custom)
md5sums=('ce1dc7ca62b52d3835b73132423492d0'
         '119ba89010b1e01fd6cde8d84acf97ca')
sha256sums=('51bc0b416bc37deaf147a0f90765d43056a7f8a3b828a2371eac3c47ee52416b'
            'b547926cd01a31530af3fb9c31000061af518d117018df7c12961ceffd6800d8')

_use_arch_libs="yes"
_libs_to_remove="libQt*"

package() {
	cp -a opt usr "$pkgdir"
	rm -f "$pkgdir/opt/$_realname/Bin/"libQt*
	install -D -m644 "$srcdir/qt.conf" "$pkgdir/opt/$_realname/Bin/qt.conf"
}
