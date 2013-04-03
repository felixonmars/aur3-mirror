# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-mime-types
_gemname=${pkgname#ruby-}
pkgver=1.22
pkgrel=1
pkgdesc="Manages a MIME Content-Type database that will return the Content-Type for a given filename."
arch=('any')
url="http://mime-types.rubyforge.org"
license=('GPL')
depends=('ruby' 'rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('cf5b89a808b53202bc1622bd08ca3fd021708d5980db0596594ea4e2d646b0d4')

package() {
  cd "${srcdir}"

  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  HOME=/tmp gem install --no-user-install --ignore-dependencies \
  -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
