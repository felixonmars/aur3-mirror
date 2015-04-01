# Maintainer: Henning Bekel <h dot bekel at googlemail dot com>
pkgname=ruby-uuid  
pkgver=2.3.7
pkgrel=1
pkgdesc="Generate Universal Unique Identifiers (UUID)"
url="http://github.com/assaf/uuid"
arch=('i686' 'x86_64')
license=('MIT')
depends=(ruby ruby-macaddr)
source=(http://github.com/assaf/uuid/tarball/v${pkgver} ruby-uuid.license)
md5sums=('6e325a21f972542de2989177ba42fd17'
         '2c7b11d4439625b9c0acd2197a2aed5d')

build() {
  cd "$srcdir/assaf-uuid-4ec7b8a"
  gem build uuid.gemspec
}

package() {
  cd "$srcdir/assaf-uuid-4ec7b8a"

  gem install --ignore-dependencies \
    -i "$pkgdir/$(gem environment gemdir)" "uuid-${pkgver}.gem"

  install -D -m644 ../ruby-uuid.license $pkgdir/usr/share/licenses/ruby-uuid/MIT-LICENSE
}
