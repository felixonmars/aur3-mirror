# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>
# Maintainer: Emiliano Vavassori <syntaxerrormmm@gmail.com>
pkgname=ruby-unf_ext
_gemname=unf_ext
pkgver=0.0.7.1
pkgrel=1
pkgdesc="Unicode Normalization Form support library for CRuby."
arch=('any')
url="https://github.com/knu/ruby-unf_ext"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('39bfbb9e124410f57a97d1837f02d42a')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  
  gem install --ignore-dependencies --no-user-install -f -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
