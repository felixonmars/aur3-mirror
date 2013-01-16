# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-activerecord2xx
_gemname=activerecord
pkgver=2.3.15
pkgrel=1
pkgdesc="Implements the ActiveRecord pattern (Fowler, PoEAA) for ORM."
arch=(any)
url="http://www.rubyonrails.org/"
license=('MIT')
depends=('ruby' 'rubygems' 'ruby-activesupport2xx')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('2f97c0f8346466f5125f8181f00cd2162e915b5205162abb8ae2f5d72c7406e8')

package() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
