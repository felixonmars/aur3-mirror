# Maintainer: Dario Dax Vilardi <dax@deelab.org>
pkgname=swiftfox-i686
pkgver=3.6.13
pkgrel=1
_pkgname=swiftfox
_pkgarch=i686
pkgdesc="Swiftfox is a prebuilt version of Firefox3, optimized for i686 architectures."
url="http://www.getswiftfox.com"
license=('custom')
arch=(i686)
conflicts=('swiftfox')
depends=('libxt' 'nss' 'sqlite3')
provides=(swiftfox=${pkgver})
source=(http://www.getswiftfox.com/builds/releases/$pkgver/$_pkgname-$pkgver-$_pkgarch.tar.bz2
        http://www.getswiftfox.com/LICENSE
        swiftfox.desktop
        swiftfox.png)
md5sums=('8623d64ce119047ffb5a9a149b245426'
         '7d2764ff8d5c9b0ba5be6028a3459e1d'
         '7b2bc5553bb2beaa8d49b4745bbc0c02'
         '92cb01c531a7ada40ca063b58d597de2')

build() {
  mkdir $pkgdir/opt/
  cp -r $srcdir/swiftfox $pkgdir/opt/swiftfox
  mkdir -p $pkgdir/usr/bin
  ln -s /opt/$_pkgname/swiftfox $pkgdir/usr/bin/swiftfox
  install -D -m644 $srcdir/swiftfox.desktop $pkgdir/usr/share/applications/swiftfox.desktop
  install -D -m644 $srcdir/swiftfox.png $pkgdir/usr/share/pixmaps/swiftfox.png
  install -D -m644 -D $srcdir/LICENSE $pkgdir/usr/share/licenses/swiftfox/LICENSE
}
