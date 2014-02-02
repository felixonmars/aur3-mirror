# Maintainer: Jochen Schalanda <jochen+aur AT schalanda.aname>
pkgname=ruby-hashr
pkgver=0.0.22
_realname='hashr'
pkgrel=3
pkgdesc='Simple Hash extension to make working with nested hashes (e.g. for configuration) easier and less error-prone.'
arch=(any)
url='https://github.com/svenfuchs/hashr'
license=("MIT")
depends=('ruby')
source=(https://rubygems.org/downloads/${_realname}-${pkgver}.gem)
noextract=(${_realname}-${pkgver}.gem)
md5sums=('46cb93d63146f4ba7093d5c3153f419c')

package() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
    -i "$pkgdir$_gemdir" ${_realname}-$pkgver.gem
}
