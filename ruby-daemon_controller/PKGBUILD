# Maintainer: Nikolay Bryskin <devel.niks@gmail.com>
pkgname=ruby-daemon_controller
_gemname=${pkgname#ruby-}
pkgver=1.1.0
pkgrel=1
pkgdesc="Ruby lib for robust daemon management."
arch=(any)
url=https://github.com/FooBarWidget/daemon_controller
license=(MIT)
depends=(ruby rubygems)
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('402d36d17775c4375c2ae430008225f4')

build() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
