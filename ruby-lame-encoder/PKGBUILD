# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>
# Maintainer: Emiliano Vavassori <syntaxerrormmm@gmail.com>
pkgname=ruby-lame-encoder
_gemname=lame_encoder
pkgver=0.1.1
pkgrel=2
pkgdesc="LAME Encoder wrapper for Ruby"
arch=('any')
url="http://lame-encoder.rubyforge.org/"
license=('GPL2' 'RUBY')
depends=('ruby')
makedepends=('ruby')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('10c8c439bc232c4539f001148394f0b9')

package() {
  cd "${srcdir}"
  local _gemdir="$(env ruby -rubygems -e 'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -f -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
