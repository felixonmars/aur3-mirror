# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=ruby-dm-migrations
_gemname=${pkgname#ruby-}
pkgver=1.2.0
pkgrel=1
pkgdesc="DataMapper plugin for writing and speccing migrations"
arch=('any')
url="http://github.com/datamapper/dm-migrations"
license=('custom')
depends=('ruby' 'rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('002e424048b74b3b163924aca975ffa0')

build() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -d ${pkgdir}/usr/share/licenses/${pkgname} || return 1
  install -D -m644 ${pkgdir}/usr/lib/ruby/gems/*/gems/${_gemname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
}
