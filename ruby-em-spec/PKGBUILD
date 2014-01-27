# Maintainer: Andrwe Lord Weber <lord-weber-andrwe@andrwe.org>
_gemname=em-spec
pkgname=ruby-$_gemname
pkgver=0.2.6
pkgrel=2
pkgdesc="BDD for Ruby/EventMachine"
arch=('any')
url="http://github.com/schmurfy/em-spec"
license=('unknown')
depends=('ruby' 'ruby-rspec>2.6.0' 'ruby-bacon' 'ruby-test-unit' 'ruby-eventmachine' 'ruby-growl' 'ruby-guard-rspec' 'ruby-guard-bundler')
source=("http://gems.rubyforge.org/gems/$_gemname-${pkgver}.gem")
noextract=("$_gemname-${pkgver}.gem")
md5sums=('3e9505684ff2400df17d2c2ae47ee4be')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem \
    -n "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
