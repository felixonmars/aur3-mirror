# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Adam Russell <adamlr6+arch@gmail.com>
# Contributor: eagletmt <eagletmt@gmail.com>
_gemname=rspec-core
pkgname=ruby-rspec-core-2.14
pkgver=2.14.8
pkgrel=1
pkgdesc='RSpec runner and example groups'
arch=('any')
url='https://github.com/rspec/rspec-core'
license=('MIT')
depends=('ruby')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('8c43f4dbc105ca622e72693c8aed533386580c0fa082bcd280777cda66f1525f')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e 'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" \
    -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
}

# vim:set ts=2 sw=2 et:
