# Maintainer: Guten Ye

pkgname="oldtime"
pkgver=2.1.0
pkgrel=1
pkgdesc="a bash script using rsync to provide a backup solution."
arch=("any")
url="https://github.com/GutenYe/oldtime"
license=("MIT")
depends=("rsync")
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/GutenYe/oldtime/archive/v$pkgver.tar.gz"
)

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/oldtime"
  cp -r * "$pkgdir/usr/share/oldtime"
  ln -s "/usr/share/oldtime/libexec/oldtime" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
md5sums=('5aac85d01d287223322d0bc7369d506f')
