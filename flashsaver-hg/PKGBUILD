pkgname=flashsaver-hg
pkgver=20130918
pkgrel=1
pkgdesc="flashsaver is a simple system for running bootable linux root partitions from flash devices which are sensitive to writes"
url="https://bitbucket.org/aioannidis/flashsaver/"
arch=('x86_64' 'i686')
license=('GPLv3')
source=("${pkgname%-*}::hg+https://bitbucket.org/aioannidis/flashsaver")
md5sums=("SKIP")

package() {
  cd "${srcdir}/${pkgname%-*}"
  install -Dm644 "usr/lib/initcpio/hooks/flashsaver" "$pkgdir/usr/lib/initcpio/hooks/flashsaver"
  install -Dm644 "usr/lib/initcpio/install/flashsaver" "$pkgdir/usr/lib/initcpio/install/flashsaver"
}
