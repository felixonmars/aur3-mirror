# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Troels Kofode Jacobsen <tkjacobsen@gmail.com>

pkgname=podracer
pkgver=1.4
pkgrel=2
pkgdesc='Simple console podcast downloader'
arch=('any')
url='http://podracer.sourceforge.net/'
license=('MIT')
depends=('curl')
source=("http://downloads.sourceforge.net/podracer/$pkgname-$pkgver.tar.bz2")
md5sums=('ad003164a0521832f8d4c568dec88d73')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # main script
  install -D -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  # documentation
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  install -m644 CREDITS README ChangeLog TODO sample.subscriptions "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # config file
  install -D -m644 "$pkgname.conf" "$pkgdir/etc/$pkgname.conf"

  # man
  install -D -m644 "$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}
