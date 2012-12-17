pkgname=lenovo-b570-brightness
pkgver=1
pkgrel=1
pkgdesc="A script by Oleh Prypin to control screen brightness on the Lenovo B570."
arch=('i686' 'x86_64')
url="http://ideone.com/yPlo5"
license=('unknown')
depends=('python')
install="${pkgname}.install"

_urlmod=yPlo5

source=("http://ideone.com/plain/$_urlmod")

package () {
cp $srcdir/$_urlmod $srcdir/brightness
patch "$srcdir/brightness" $srcdir/../lenovo-b570-brightness.patch
mkdir -p "${pkgdir}/usr/bin/"
mv "$srcdir/brightness" "$pkgdir/usr/bin/brightness"
chmod 0755 "$pkgdir/usr/bin/brightness"
}
md5sums=('ae36678c902f013c345f886064ace996')
