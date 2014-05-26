# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=bittornado
pkgver=0.3.18
pkgrel=5
pkgdesc="An experimental client based on the official bittorrent"
arch=('any')
url="http://bittornado.com/"
license=('MIT')
depends=('python2')
optdepends=('wxpython: for using the graphical client'
            'wxgtk: for using the graphical client')
source=(http://download2.bittornado.com/download/BitTornado-$pkgver.tar.gz)
md5sums=('faeb137036cfaaeab91afc7f62c7dc30')

package() {
  cd "${srcdir}/BitTornado-CVS"

  python2 setup.py install --root="${pkgdir}"

#license file install
  install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
