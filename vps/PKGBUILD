# Maintainer: TDY <tdy@archlinux.info>

pkgname=vps
pkgver=0.5
pkgrel=1
pkgdesc="An interactive process tree viewer"
arch=('any')
url="http://hea-www.harvard.edu/~fine/Tech/vps.html"
license=('custom')
depends=('perl')
source=(http://hea-www.harvard.edu/~fine/Tech/vps vps.1)
md5sums=('2b3c316231f7cabd739a2d8cc555569a'
         'e6b5efadbcde7abad91744506481d3e3')

package() {
  cd "$srcdir"
  sed -n '4,8 s/# //p' vps >license.txt
  install -Dm755 vps "$pkgdir/usr/bin/vps"
  install -Dm644 vps.1 "$pkgdir/usr/share/man/man1/vps.1"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/vps/license.txt"
}

# vim:set ts=2 sw=2 et:
