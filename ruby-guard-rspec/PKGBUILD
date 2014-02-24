# Maintainer: Andrwe Lord Weber <lord-weber-andrwe@andrwe.org>
_gemname=guard-rspec
pkgname=ruby-$_gemname
pkgver=4.2.4
pkgrel=1
pkgdesc="Guard gem for RSpec"
arch=('any')
url="https://rubygems.org/gems/guard-rspec"
license=('MIT')
depends=('ruby' 'ruby-guard' 'ruby-rspec>=2.14' 'ruby-bundler>=1.3.5' 'ruby-launchy')
source=("http://gems.rubyforge.org/gems/$_gemname-${pkgver}.gem")
noextract=("$_gemname-${pkgver}.gem")
md5sums=()
md5sums=('dfd8c7d0606259844ca658f3b3ad200f')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem \
    -n "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
