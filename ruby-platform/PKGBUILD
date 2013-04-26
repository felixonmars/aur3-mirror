# Maintainer: Anshuman Bhaduri <anshuman (dot) bhaduri 0 (at) gmail (dot) com>

pkgname=ruby-platform
_gemname=Platform
pkgver=0.4.0
pkgrel=1
pkgdesc="Hopefully robust platform sensing."
arch=('any')
url="http://rubyforge.org/projects/platform/"
license=('BSD')
depends=('ruby' 'rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('9947ef2e902de65ffff3cd5912269678')

package() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
}
