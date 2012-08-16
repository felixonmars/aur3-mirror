# Maintainer: Jochen Schalanda <jochen+aur AT schalanda.aname>
pkgname=ruby-rush
pkgver=0.6.8
_gemname='rush'
pkgrel=1
pkgdesc='A Ruby replacement for bash+ssh, providing both an interactive shell and a library. Manage both local and remote unix systems from a single client.'
arch=(any)
url='http://rush.heroku.com/'
license=('MIT')
depends=('ruby' 'ruby-session')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)

build() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
}
md5sums=('d99cf8a9f82e9edf273d235804cbba59')
