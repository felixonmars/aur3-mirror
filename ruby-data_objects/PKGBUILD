# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=ruby-data_objects
_gemname=${pkgname#ruby-}
pkgver=0.10.8
pkgrel=1
pkgdesc="Provide a standard and simplified API for communicating with RDBMS from Ruby"
arch=('any')
url="http://github.com/datamapper/do"
license=('MIT' 'custom')
depends=('ruby' 'rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('d29e371e9659236069d9994f4533baeb')

build() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -d ${pkgdir}/usr/share/licenses/${pkgname} || return 1
  install -D -m644 ${pkgdir}/usr/lib/ruby/gems/*/gems/${_gemname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
}
