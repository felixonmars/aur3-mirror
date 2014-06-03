# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Adam Russell <adamlr6+arch@gmail.com>
# Contributor: eagletmt <eagletmt@gmail.com>
_gemname=rspec
pkgname=ruby-rspec-2.14
pkgver=2.14.1
pkgrel=1
pkgdesc='Behaviour-Driven Development tool for Ruby programmers'
arch=('any')
url='https://github.com/rspec'
license=('MIT')
depends=(
  'ruby'
  "ruby-rspec-core-2.14>=${pkgver}"
  "ruby-rspec-expectations-2.14>=${pkgver}"
  "ruby-rspec-mocks-2.14>=${pkgver}")
noextract=($_gemname-$pkgver.gem)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('4f9fc6c58696faa22571ca80d710fd0e4f30eaeb700155968d36df303f279e8c')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e 'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}

# vim:set ts=2 sw=2 et:
