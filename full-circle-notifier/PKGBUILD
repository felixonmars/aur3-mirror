# Maintainer: Lucas Westermann <lswest34 AT gmail DOT com>
pkgname=full-circle-notifier
pkgver=1.0.3
pkgrel=1
pkgdesc="A notifier for the popular FCM Ubuntu Community Magazine."
arch=('x86_64' 'i686')
url="https://github.com/mrmonday/full-circle-notifier"
license=('GPL')
depends=('qjson' 'qt')
source=("https://github.com/mrmonday/full-circle-notifier/tarball/$pkgver-hat")
md5sums=('1792f3d807b37b8e612b6dbeddcaba04')

build() {
  cd "$srcdir/mrmonday-full-circle-notifier-f811079"
  qmake DESTDIR=$pkgdir/opt/$pkgname 
  make
}

package() {
  cd "$srcdir/mrmonday-full-circle-notifier-f811079"
  mkdir -p $pkgdir/usr/bin
  mv assets/usr/share/ "$pkgdir/usr/share"
  mv * "$pkgdir/opt/$pkgname"
  ln -s "/opt/full-circle-notifier/fcnotifier" "$pkgdir/usr/bin/fcnotifier"
}
