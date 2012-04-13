# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-ruby_core_source
_gemname=${pkgname#ruby-}
pkgver=0.1.5
pkgrel=1
pkgdesc="Retrieve Ruby core source files."
arch=('any')
url="http://github.com/mark-moseley/ruby_core_source"
license=('MIT')
depends=('ruby' 'rubygems' 'ruby-archive-tar-minitar')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('9e9b4739365794ee1f8870222893486c')

build() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
