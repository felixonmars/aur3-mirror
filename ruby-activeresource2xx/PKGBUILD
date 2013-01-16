# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-activeresource2xx
_gemname=activeresource
pkgver=2.3.15
pkgrel=1
pkgdesc="Wraps web resources in model classes that can be manipulated through XML over REST."
arch=(any)
url="http://www.rubyonrails.org/"
license=('MIT')
depends=('ruby' 'rubygems' 'ruby-activesupport2xx')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('95999b7b46290d8c62d39d573a30bb223af851e528746fe1438bcc98704ad9fa')

package() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
