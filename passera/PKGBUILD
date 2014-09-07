# Maintainer: Daniel Dias <dias AT archlinux DOT info>
pkgname=passera
pkgver=0.1.3
pkgrel=1
pkgdesc="Turn any entered passphrase into a strong secure password"
arch=('i686' 'x86_64')
url="https://github.com/mwgg/passera"
license=('GPL')
depends=('xclip')
provides=('passera')
source=(http://mw.gg/d/$pkgname-linux.tar.gz
	http://github.com/mwgg/passera/raw/master/LICENSE)
md5sums=('9bf38ceaddb48fbf780eecf7604b6463'
         '2b621d1321a879614b38167796121199')

_arch=386
if test "$CARCH" == x86_64; then
   _arch=amd64
fi

package() {
  install -Dm755 "$srcdir/passera-linux-$_arch" "$pkgdir/usr/bin/$pkgname"     
  install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
