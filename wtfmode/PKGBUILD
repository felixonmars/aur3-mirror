# Maintainer: Ngoc Nguyen Bao <baongoc124@gmail.com>
pkgname=wtfmode
pkgver=1.1.0
pkgrel=1
pkgdesc="WTFmode.net is a gaming network application that runs equally well on Windows, Linux and Mac OS X. WTFmode.net connects your Local Area Network (LAN) games to other players on the Internet."
arch=('i686' 'x86_64')
url="http://www.wtfmode.net"
license=('unknown')
depends=('qt' 'curl')
[ "$CARCH" == "x86_64" ] && depends=('lib32-qt' 'lib32-curl')
source=("http://www.wtfmode.net/static/packages/$pkgver/$pkgname-$pkgver-linux.zip")
md5sums=('cbcb7236c1810caa227fe2844c3f0d4e')

build() {
  cd "$srcdir/WTFmode"
  install -dm 755 "$pkgdir/opt/WTFmode"
  install -Dm 755 WTFmode "$pkgdir/opt/WTFmode"
  install -Dm 644 w3xp.so "$pkgdir/opt/WTFmode"
  install -Dm 755 wtfup "$pkgdir/opt/WTFmode"
  install -dm 755 "$pkgdir/usr/bin/"
  ln -s /opt/WTFmode/WTFmode $pkgdir/usr/bin/
  if [ $CARCH == 'i686' ] ; then
    install -dm 755 "$pkgdir/usr/lib"
    ln -s /usr/lib/libcrypto.so $pkgdir/usr/lib/libcrypto.so.10
  else
    install -dm 755 "$pkgdir/usr/lib32"
    ln -s /usr/lib32/libcrypto.so $pkgdir/usr/lib32/libcrypto.so.10
  fi
}
# vim:set ts=2 sw=2 et:
