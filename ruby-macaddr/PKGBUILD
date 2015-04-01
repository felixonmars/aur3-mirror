# Maintainer: Henning Bekel <h dot bekel at googlemail dot com>
pkgname=ruby-macaddr
pkgver=1.7.1
pkgrel=1
pkgdesc="Access MAC-Addresses from Ruby"
url="http://rubyforge.org/projects/codeforpeople/"
arch=('i686' 'x86_64')
license=('RUBY')
depends=('ruby' 'ruby-systemu')
source=(https://rubygems.org/downloads/macaddr-${pkgver}.gem)
md5sums=('aade5990769cbeee7a0df9390f3f7030')
noextract=(macaddr-${pkgver}.gem)

package() {
  cd $srcdir
  gem install --ignore-dependencies \
    -i "$pkgdir/$(gem environment gemdir)" \
    macaddr-${pkgver}.gem || return 1
}
