# Maintainer: Anshuman Bhaduri <anshuman (dot) bhaduri 0 (at) gmail (dot) com>

pkgname=ruby-popen4
_gemname=${pkgname#ruby-}
pkgver=0.1.2
pkgrel=1
pkgdesc="A single API across platforms for executing a command in a child process."
arch=('any')
url="https://github.com/shairontoledo/popen4/"
license=('RUBY')
depends=('ruby' 'rubygems' 'ruby-open4' 'ruby-platform')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('b09ff3770ac69ae7a218b82be1e038cb')

package() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
}
