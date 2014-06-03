# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Adam Russell <adamlr6+arch@gmail.com>
# Contributor: eagletmt <eagletmt@gmail.com>
_gemname=rspec-expectations
pkgname=ruby-${_gemname}-2.14
pkgver=2.14.5
pkgrel=1
pkgdesc='RSpec expectations (should[_not] and matchers)'
arch=('any')
url='https://github.com/rspec/rspec-expectations'
license=('MIT')
depends=('ruby' 'ruby-diff-lcs>=1.1.3' 'ruby-diff-lcs<2.0')
noextract=($_gemname-$pkgver.gem)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('c961c9dff8127c1b4ddd24358e5c921f8f09805a92c42ff996e66c39119f28da')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e 'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}

# vim:set ts=2 sw=2 et:
