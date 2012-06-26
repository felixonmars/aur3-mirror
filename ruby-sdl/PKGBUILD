# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-sdl
_gemname=${pkgname/-}
pkgver=2.1.2
pkgrel=1
pkgdesc="Is an extension library to use SDL."
arch=('i686' 'x86_64')
url="http://www.kmc.gr.jp/~ohai"
license=('LGPL')
depends=('ruby' 'rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('c243fac693b38d2b027f576cbaeaf4c5')

build() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
