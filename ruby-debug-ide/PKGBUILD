# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-debug-ide
_gemname=${pkgname}
pkgver=0.4.17.beta14
pkgrel=1
pkgdesc="An interface which glues ruby-debug to IDEs like Eclipse (RDT), NetBeans and RubyMine."
arch=('i686' 'x86_64')
url="https://github.com/JetBrains/ruby-debug-ide"
license=('MIT')
depends=('ruby' 'rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('7db37803e86c63e11ba364a1d79135b8')

build() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem -- --with-ruby-include=/usr/src/ruby-1.9.3-p125
}
