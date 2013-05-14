# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=w3watch-systemd
pkgver=0.2.3
pkgrel=1
pkgdesc='Systemd user unit for w3watch'
arch=('any')
url='https://github.com/felixonmars/w3watch-systemd'
license=('GPL')
depends=('systemd' 'w3watch')
source=("https://github.com/felixonmars/w3watch-systemd/archive/${pkgver}.tar.gz")

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/w3watch.service" "$pkgdir/usr/lib/systemd/user/w3watch.service"
  install -Dm644 "$srcdir/$pkgname-$pkgver/w3watch.timer" "$pkgdir/usr/lib/systemd/user/w3watch.timer"
  install -Dm755 "$srcdir/$pkgname-$pkgver/w3watch-systemd" "$pkgdir/usr/lib/systemd/scripts/w3watch-systemd"
}

sha512sums=('eb05e218adecc313a6c5f70379fffc8abbbcb96f1f3be2c65aeeca468d5e7f870cd395fb9f20f6c76a37c4bef8cdf96eefe353f17b298e31493def53a767f51b')
