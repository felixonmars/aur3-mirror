# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-kramdown-last
_gemname=kramdown
pkgver=0.13.7
pkgrel=1
pkgdesc="Library for parsing and converting a superset of Markdown."
arch=(any)
url="http://kramdown.rubyforge.org/"
license=('GPL')
depends=('ruby')
conflicts=('ruby-kramdown')

source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('2a315e44681d62fdecb36430cd4b8027')

build() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  
  gem install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
}
