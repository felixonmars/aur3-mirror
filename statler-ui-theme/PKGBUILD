# Maintainer: Corey Richardson <corey@octayn.net>
pkgname=statler-ui-theme
pkgver=0.02
pkgrel=1
pkgdesc="Crunchbang's Gtk, Openbox, and xfwm themes"
arch=('any')
url="http://www.crunchbanglinux.org/"
license=('custom:WTFPL')
depends=('gtk-engine-murrine')

source=("http://packages.crunchbang.org/statler/pool/main/${pkgname}_$pkgver.tar.gz")
md5sums=('eb834f4c5de1d3e0cd082dce000328d8')

package() {
  cd "$srcdir"/$pkgname-$pkgver/statler
  mkdir -p "$pkgdir"/usr/share/themes/Statler
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  cp ../debian/copyright "$pkgdir"/usr/share/licenses/$pkgname/
  cp -rt "$pkgdir"/usr/share/themes/Statler *
}
# vim:set ts=2 sw=2 et:
