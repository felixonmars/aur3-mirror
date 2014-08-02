# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>

pkgname=ruby-lumberjack
pkgver=1.0.9
_realname="lumberjack"
pkgrel=1
pkgdesc="A simple, powerful, and very fast logging utility..."
arch=('any')
url="https://rubygems.org/gems/lumberjack"
license=("MIT")
source=(http://gems.rubyforge.org/gems/$_realname-$pkgver.gem)
md5sums=('461c017af41c2bc77600396783c06476')
noextract=($real_name-$pkgver.gem)

package() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" ${_realname}-$pkgver.gem
}

