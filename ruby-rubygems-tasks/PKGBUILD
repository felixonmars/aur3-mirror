# Maintainer: Andrwe Lord Weber <lord-weber-andrwe@andrwe.org>
_gemname=rubygems-tasks
pkgname=ruby-$_gemname
pkgver=0.2.4
pkgrel=1
pkgdesc="Rake tasks for managing and releasing Ruby Gems."
arch=('any')
url="https://github.com/postmodern/rubygems-tasks#readme"
license=('MIT')
depends=('ruby' 'ruby-rspec' 'ruby-yard')
source=("http://gems.rubyforge.org/gems/$_gemname-${pkgver}.gem")
noextract=("$_gemname-${pkgver}.gem")
md5sums=('d4ba1d14100c750bd7b83795617ea0cb')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem \
    -n "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
