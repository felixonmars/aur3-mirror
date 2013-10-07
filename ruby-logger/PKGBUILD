pkgname=ruby-logger
_gemname=${pkgname#ruby-}
pkgver=1.2.8
pkgrel=1
pkgdesc="simple logging utility"
arch=(any)
url="http://github.com/nahi/logger"
license=('custom:ruby')
depends=('ruby')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('3ad9ecc459edd25d972a0a3b52110f79')

package() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
