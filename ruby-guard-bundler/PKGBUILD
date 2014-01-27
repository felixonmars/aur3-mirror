# Maintainer: Andrwe Lord Weber <lord-weber-andrwe@andrwe.org>
_gemname=guard-bundler
pkgname=ruby-$_gemname
pkgver=2.0.0
pkgrel=1
pkgdesc="Guard gem for Bundler"
arch=('any')
url="https://rubygems.org/gems/guard-bundler"
license=('MIT')
depends=('ruby' 'ruby-guard' 'ruby-bundler' 'ruby-rspec')
makedepends=('ruby')
source=("http://gems.rubyforge.org/gems/$_gemname-${pkgver}.gem")
noextract=("$_gemname-${pkgver}.gem")
md5sums=('43700df99c6c032a60bb5e6b4390fc50')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem \
    -n "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
