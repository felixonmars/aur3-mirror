# Maintainer: Andrwe Lord Weber <lord-weber-andrwe@andrwe.org>
_gemname=local_port
pkgname=ruby-$_gemname
pkgver=0.1.0
pkgrel=1
pkgdesc="Find out which local ports are usable."
arch=('any')
url="https://rubygems.org/gems/local_port"
license=('MIT')
depends=('ruby' 'ruby-bundler' 'ruby-rspec' 'ruby-rubygems-tasks')
source=("http://gems.rubyforge.org/gems/$_gemname-${pkgver}.gem")
noextract=("$_gemname-${pkgver}.gem")
md5sums=('35525554f8e01fc340f2aded15bf05ce')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem \
    -n "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
