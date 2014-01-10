# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

_pkgname=wingide
pkgname=wingide4
pkgver=4.1.14
pkgrel=1
_pkgarch=`uname -m`
pkgdesc="Wing IDE Professional is the full-featured Python IDE for professional programmers."
url="http://www.wingware.com"
license=('custom')
arch=('i686' 'x86_64')
source=("http://wingware.com/pub/$_pkgname/$pkgver/$_pkgname-$pkgver-$pkgrel-x86_64-linux.tar.gz"
        "$pkgname.desktop")
options=(!strip)
sha1sums=('e0047961e74abd023d0282d8ac095859ed098c95'
          'ed665aa1ada0a008213b18f080bddf2edda38d39')

if [ "$CARCH" == "i686" ]; then
    _pkgarch="i386"
    sha1sums[0]='3e0f4365f8ceaa1322e7410d453b398cab1bb6f1'
    source[0]="http://wingware.com/pub/$_pkgname/$pkgver/$_pkgname-$pkgver-$pkgrel-i386-linux.tar.gz"
fi

package() {
    cd "$srcdir/$_pkgname-$pkgver-$pkgrel-$_pkgarch-linux"
    install -d "$pkgdir/opt/$pkgname" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications" "$pkgdir/usr/share/pixmaps"
    tar -xC "$pkgdir/opt/$pkgname" -f binary-package-$pkgver-$pkgrel.tar
    sed -e "s/^DIR=.*$/DIR=\/opt\/$pkgname/g" -i "$pkgdir/opt/$pkgname/wing"
    install -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/"
    ln -s /opt/$pkgname/wing "$pkgdir/usr/bin/$pkgname"
    ln -s /opt/$pkgname/resources/wing128.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
