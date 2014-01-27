# Maintainer: foalsrock <foalsrock at gmail dot com>

_gemname=bropages
pkgname=bropages
pkgver=0.0.15
pkgrel=2
pkgdesc="Highly readable supplement to man pages. Shows simple, concise examples for unix commands."
arch=(any)
url="http://bropages.org/"
license=('unknown')
depends=('ruby' 'ruby-rest-client' 'ruby-commander' 'ruby-highline'
        'ruby-json_pure' 'ruby-smart_colored')
makedepends=('ruby')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('1c3462d96f07d6ccf952e11b41e8d789')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" \
    ${_gemname}-${pkgver}.gem

  mkdir -p "${pkgdir}/usr/bin"
  ln -s ${_gemdir}/bin/bro ${pkgdir}/usr/bin/bro
}
