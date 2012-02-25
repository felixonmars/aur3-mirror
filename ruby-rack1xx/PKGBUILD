# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-rack1xx
_gemname=rack
pkgver=1.2.1
pkgrel=2
pkgdesc="A Ruby Webserver Interface"
arch=(any)
url="http://rack.rubyforge.org/"
license=('MIT')
depends=('ruby' 'rubygems')
provides=('ruby-rack')
conflicts=('ruby-rack' 'ruby-rack110')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('ad93c6bf876bb75af374b416593a4c08')

build() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
}
