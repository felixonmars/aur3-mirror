# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-actionmailer2xx
_gemname=actionmailer
pkgver=2.3.15
pkgrel=1
pkgdesc="Is the Rails framework which handles email delivery."
arch=(any)
url="http://www.rubyonrails.org/"
license=('MIT')
depends=('ruby' 'rubygems' 'ruby-actionpack2xx')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('9b635cfff21a47f69d4e2ed4080597a94a86a4d627734128e41c8ae9bcd4317a')

package() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
