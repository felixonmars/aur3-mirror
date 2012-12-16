# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=firefox-speed-dial
pkgver=0.9.6.12
pkgrel=1
pkgdesc="Firefox extension that simplifies the access to your most visited websites"
arch=('any')
url="http://speeddial.uworks.net/"
license=('GPL2' 'LGPL2.1' 'MPL')
depends=('firefox')
source=(http://speeddial.uworks.net/speed_dial-$pkgver-fx.xpi)
md5sums=('4406ce55fb54467ac90f56035c50d0c1')

package() {
  cd "$srcdir"

  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)

  install -d -m755 "$pkgdir"/usr/lib/firefox/extensions/$emid
  cp -a * "$pkgdir"/usr/lib/firefox/extensions/$emid

  rm -f "$pkgdir"/usr/lib/firefox/extensions/$emid/*.xpi
  chmod -R -x+X "$pkgdir"/usr/lib/firefox/extensions/$emid
}
