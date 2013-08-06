# Maintainer: Anshuman Bhaduri <anshuman dot bhaduri0 at gmail dot com>
# Shamelessly stolen from ruby-ansi

pkgname=ruby-ansi-1.3
_gemname=ansi
pkgver=1.3.0
pkgrel=1
pkgdesc="A collection of ANSI escape code related libraries enabling ANSI colorization and stylization of console output."
arch=('any')
url="http://github.com/rubyworks/ansi"
license=('BSD')
depends=('ruby' 'rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('adbe63b3eb45ee82599169edb56468b7')

package() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
      -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
}
