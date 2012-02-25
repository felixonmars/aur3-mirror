# Contributor: Benjamin Andresen <benny AT klapmuetz DOT org>
# Contributor: Henning Bekel <h dot bekel at googlemail dot com>
# Maintainer: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-fcgi
_gemname=${pkgname}
pkgver=0.8.9
pkgrel=2
pkgdesc="Is a language independent, scalable, open extension to CGI that provides high performance without the limitations of server specific APIs."
arch=(any)
url="http://github.com/saks/ruby-fcgi"
license=('ruby')
depends=('ruby' 'rubygems' 'fcgi')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('982578b97c5de92a95187d074c5156de')

build() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
