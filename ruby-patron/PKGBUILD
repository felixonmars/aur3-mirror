# Maintainer: Pierre Carrier <pierre@spotify.com>
_gemname=patron
pkgname=ruby-${_gemname}
pkgver=0.4.18
pkgrel=1
pkgdesc="Patron HTTP Client"
arch=('any')
url="https://github.com/toland/patron"
license=('BSD')
depends=('ruby' 'curl')
makedepends=('ruby' 'ruby-rake-compiler>=0.7.5' 'ruby-bundler>=1.0.0')
source=("http://gems.rubyforge.org/gems/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
md5sums=('4023a949660cb318c40595e5240f5a17')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "${pkgdir}${_gemdir}" "${_gemname}-${pkgver}.gem" \
    -n "${pkgdir}/usr/bin"
}
