# Maintainer: Ivan Pulido <ijpulidos[AT]riseup.net>
pkgname=ctioga2
pkgver=0.10.1
pkgrel=2
pkgdesc="Command-line based plotting program, based on the ruby tioga plotting library."
arch=(any)
url="http://ctioga2.sourceforge.net/"
license=('GPL')
depends=('ruby' 'ruby-tioga' 'texlive-bin' 'rubygems') 
source=(http://downloads.sourceforge.net/project/ctioga2/$pkgname-${pkgver}.tar.bz2)
md5sums=('ff3f0a035ed3eb1ba4ae571eea8f56cf')

build() {
  cd "$pkgname-$pkgver"
  ruby setup.rb config --prefix=/usr
  ruby setup.rb setup
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  ruby setup.rb install --prefix="$pkgdir"
}

# vim:set ts=2 sw=2 et:
