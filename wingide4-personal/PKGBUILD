# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

_pkgname=wingide-personal
pkgname=wingide4-personal
pkgver=4.1.14
pkgrel=1
_pkgarch=`uname -m`
pkgdesc="Wing IDE Personal is a low-cost Python IDE designed for students and hobbyists."
url="http://www.wingware.com"
license=('custom')
arch=('i686' 'x86_64')
source=("http://wingware.com/pub/$_pkgname/$pkgver/$_pkgname-$pkgver-$pkgrel-x86_64-linux.tar.gz"
        "$pkgname.desktop")
options=(!strip)
sha1sums=('3031ba0e39d39a84f3889a67ec995b19fe1cc590'
          '3ad8d235c5ef27e48864cafe91bf492696c5e542')

if [ "$CARCH" == "i686" ]; then
    _pkgarch="i386"
    sha1sums[0]='954a6cb011996170d812641b84b9b1e77317ba86'
    source[0]="http://wingware.com/pub/$_pkgname/$pkgver/$_pkgname-$pkgver-$pkgrel-i386-linux.tar.gz"
fi

package() {
    cd "$srcdir/$_pkgname-$pkgver-$pkgrel-$_pkgarch-linux"
    install -d "$pkgdir/opt/$pkgname" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications" "$pkgdir/usr/share/pixmaps"
    tar -xC "$pkgdir/opt/$pkgname" -f binary-package-$pkgver-$pkgrel.tar
    sed -e "s/^DIR=.*$/DIR=\/opt\/$pkgname/g" -i "$pkgdir/opt/$pkgname/wing-personal"
    install -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/"
    ln -s /opt/$pkgname/wing-personal "$pkgdir/usr/bin/$pkgname"
    ln -s /opt/$pkgname/resources/wing128.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
