# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-abstract
_gemname=${pkgname#ruby-}
pkgver=1.0.0
pkgrel=2
pkgdesc="Is a library which enable you to define abstract method in Ruby."
arch=(any)
url="http://rubyforge.org/projects/abstract"
license=('ruby')
depends=('ruby')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('ea26d93f0a47a530631da430c9e9b7e5')

build() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
