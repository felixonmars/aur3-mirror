pkgname=schat
pkgrel=1
pkgver=0.8.4.2277
pkgdesc="IMPOMEZIA Simple Chat — is a simple cross-platform client-server chat for local networks and the Internet with the possibility of individual settings for a specific network, with open source code, written in Qt/C++."
url="http://code.google.com/p/schat/"
depends=('qt')
license=("GPL3")
arch=('i686' 'x86_64')
source=("http://schat.googlecode.com/files/schat-$pkgver.tar.bz2" "schat.desktop")
md5sums=("d9ea46d265ddd9faf3278c55db8f16b9" "a5a91d19b548e3dffd8c334162fb4460")
build () {
  cd ${srcdir}/$pkgname-$pkgver/src
  qmake || return 1
  make || return 1
  install -d -m 755 ${pkgdir}/usr/bin/
  install -d -m 755 ${pkgdir}/usr/share/schat
  cp -R  ${srcdir}/$pkgname-$pkgver/data/* ${pkgdir}/usr/share/schat
  install -D -m 644 ${srcdir}/schat.desktop ${pkgdir}/usr/share/applications/schat.desktop
  install -m 755 ${srcdir}/$pkgname-$pkgver/out/release/* ${pkgdir}/usr/bin/
}