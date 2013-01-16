# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-rails2xx
_gemname=rails
pkgver=2.3.15
pkgrel=1
pkgdesc="The open source web application framework for the Ruby programming language."
arch=(any)
url="http://www.rubyonrails.org/"
license=('MIT')
depends=('ruby' 'ruby-activesupport2xx' 'ruby-activerecord2xx' \
'ruby-actionpack2xx' 'ruby-actionmailer2xx' 'ruby-activeresource2xx')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('21c177e2577faa9d09319a965870ee5f03d944d2e558573df852659cd729a79e')

package() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
}
