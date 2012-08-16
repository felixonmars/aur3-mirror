# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-kramdown-0.10
_gemname=${pkgname:5:8}
pkgver=0.10.0
pkgrel=1
pkgdesc="Library for parsing and converting a superset of Markdown."
arch=(any)
url="http://kramdown.rubyforge.org/"
license=('GPL')
depends=('ruby')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
provides=('ruby-kramdown=0.10.0')
conflicts=('ruby-kramdown')
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('4fbb8b2f4a78633c320666670624965b')
 
build() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
}
