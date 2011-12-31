# Maintainer : Henning Bekel <h dot bekel at googlemail dot com>

pkgname=ruby-xdg2
pkgver=2.2.2
pkgrel=1
pkgdesc="Ruby implementation of the XDG Base Directory Standard Specification"
url="http://github.com/rubyworks/xdg"
arch=('any')
license=('LGPL')
depends=('ruby')
source=("http://rubygems.org/downloads/xdg-${pkgver}.gem")
md5sums=('3b9a81c45b876819acda45e59c01d2e8')

build() { return 0; }

package() {
  cd "$srcdir"
  gem install --ignore-dependencies \
    -i "$pkgdir/$(gem environment gemdir)" xdg-${pkgver}.gem
}
