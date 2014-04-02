# Contributor: Mr. Alias <the_first_alias@yahoo.com>
# Contributor: Johannes Krampf <wuischke@amule.org>
# Contributor: Whaevr <whaevr[at]gmail[dot]com>
pkgname=wxdesigner
pkgver=2.20
pkgrel=1
pkgdesc="Visual development tool for wxWidgets - supporting C++, Python, Perl, C# and XML"
arch=('i686' 'x86_64')
[ "$CARCH" = "i686" ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.roebling.de/"
license=('as-is')
depends=('gtk2' 'libpng12' 'libjpeg6' 'libtiff3')
makedepends=('rpmextract')
[ "$CARCH" = "i686" ] && source=(http://www.wxdesigner-software.de/wxDesignerU-$pkgver-$pkgrel.i586.rpm)
[ "$CARCH" = "x86_64" ] && source=(http://www.wxdesigner-software.de/wxDesignerU-$pkgver-$pkgrel.x86_64.rpm)
[ "$CARCH" = "i686" ] && md5sums=('41805786e8c065786b79a51522c9d762')
[ "$CARCH" = "x86_64" ] && md5sums=('938df9d1cb1a04e1e7921c25905d9d26')

build() {
cd "$srcdir"

[ "$CARCH" = "i686" ] && rpmextract.sh wxDesignerU-$pkgver-$pkgrel.i686.rpm
[ "$CARCH" = "x86_64" ] && rpmextract.sh wxDesignerU-$pkgver-$pkgrel.x86_64.rpm
}

package() {
cd $srcdir

chmod 755 opt
cp -r opt $pkgdir/ || return 1

mkdir -p $pkgdir/usr/bin
ln -s /opt/wxDesigner/wxDesigner $pkgdir/usr/bin/wxDesigner || return 1
}