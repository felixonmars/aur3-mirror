# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-actionpack2xx
_gemname=actionpack
pkgver=2.3.15
pkgrel=1
pkgdesc="On rails from request to response."
arch=(any)
url="http://www.rubyonrails.org/"
license=('MIT')
depends=('ruby' 'rubygems' 'ruby-rack110' 'ruby-activesupport2xx')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('7fe685d93655ded1b5f2a63617c0bc1fa9b7a0a755680771fca44bc60dca0ffd')

package() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
