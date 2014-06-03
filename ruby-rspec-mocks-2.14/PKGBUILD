# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Adam Russell <adamlr6+arch@gmail.com>
# Contributor: eagletmt <eagletmt@gmail.com>
_gemname=rspec-mocks
pkgname=ruby-${_gemname}-2.14
pkgver=2.14.6
pkgrel=1
pkgdesc="RSpec's 'test double' framework, with support for stubbing and mocking"
arch=('any')
url='https://github.com/rspec/rspec-mocks'
license=('MIT')
depends=('ruby')
noextract=($_gemname-$pkgver.gem)
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('60eca91c74afd5f978eacdd60f4d81ff669910b6c24f023daecc70d364ac9abb')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e 'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}

# vim:set ts=2 sw=2 et:
