# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

_pkgname=wingide-101
pkgname=wingide4-101
pkgver=4.1.14
pkgrel=1
_pkgarch=`uname -m`
pkgdesc="Wing IDE 101 is free scaled down Python IDE designed for teaching introductory programming classes."
url="http://www.wingware.com"
license=('custom')
arch=('i686' 'x86_64')
source=("http://wingware.com/pub/$_pkgname/$pkgver/$_pkgname-$pkgver-$pkgrel-x86_64-linux.tar.gz"
        "$pkgname.desktop")
options=(!strip)
sha1sums=('d78922de47ab7c83dfe669f54d996249011a8e02'
          '3b63effbf53d380aeac6493a206d258ad393c2a5')

if [ "$CARCH" == "i686" ]; then
    _pkgarch="i386"
    sha1sums[0]='25a32ebeb94d57e80fe8b107c2ed8e0898644ca1'
    source[0]="http://wingware.com/pub/$_pkgname/$pkgver/$_pkgname-$pkgver-$pkgrel-i386-linux.tar.gz"
fi

package() {
    cd "$srcdir/$_pkgname-$pkgver-$pkgrel-$_pkgarch-linux"
    install -d "$pkgdir/opt/$pkgname" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications" "$pkgdir/usr/share/pixmaps"
    tar -xC "$pkgdir/opt/$pkgname" -f binary-package-$pkgver-$pkgrel.tar
    sed -e "s/^DIR=.*$/DIR=\/opt\/$pkgname/g" -i "$pkgdir/opt/$pkgname/wing-101"
    install -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/"
    ln -s /opt/$pkgname/wing-101 "$pkgdir/usr/bin/$pkgname"
    ln -s /opt/$pkgname/resources/wing128.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
