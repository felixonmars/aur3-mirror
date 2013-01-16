# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-activesupport2xx
_gemname=activesupport
pkgver=2.3.15
pkgrel=1
pkgdesc="Utility classes and extension to the standard library that were required by Rails, but found of general use."
arch=(any)
url="http://www.rubyonrails.org/"
license=('MIT')
depends=('ruby' 'rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('2528988dba42992c61f0c55935a840bee782418adc18f8ce67d0a80cf1f437bc')

package() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
