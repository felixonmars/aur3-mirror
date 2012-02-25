# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-rdiscount1xx
_gemname=rdiscount
pkgver=1.6.5
pkgrel=2
pkgdesc="Fast Implementation of Gruber's Markdown in C."
arch=(any)
url="http://github.com/rtomayko/rdiscount"
license=('GPL')
depends=('ruby' 'rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('2de321f1ba826f80b84fe45c0d013fcf')

build() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
}
