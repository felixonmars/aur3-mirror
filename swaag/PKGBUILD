# Maintainer: RunningDroid <runningdroid AT zoho.com>
# Contributor: Alexej Magura <agm2819*gmail*>
pkgname=swaag
pkgver=1.5
pkgrel=2
pkgdesc="six wheels and a gun: a tank game"
arch=('1686' 'x86_64')
url="http://bram.itch.io/swaag"
license=('unknown')
depends=('sdl2' 'gcc-libs' 'mesa')
install=swaag.install
if [ "$CARCH" == 'x86_64' ]; then
    source=("http://stolk.org/Buggy/$pkgname-$pkgver-linux64.tar.gz"
            "swaag.sh")
md5sums=('6b9bfbbe697c8ec75904766ed9d07084'
         'cb8b8047392ba0cc18cd1a72adf30ba6')
else
    source=("http://stolk.org/Buggy/$pkgname-$pkgver-linux32.tar.gz"
            "swaag.sh")
fi

package () {
  cd "$srcdir"
  install -Dm 755 "$srcdir/${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"
  install -d "$pkgdir/opt/$pkgname"
  cp -t "$pkgdir/opt/$pkgname" *.so "$pkgname"
  install -d "$pkgdir/opt/${pkgname}/home"
}
