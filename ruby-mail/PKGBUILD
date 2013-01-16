# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>
# Maintainer: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-mail
_gemname=${pkgname#ruby-}
pkgver=2.5.3
pkgrel=1
pkgdesc="Handle emails generation, parsing and sending in a simple, rubyesque manner"
arch=('any')
url="http://github.com/mikel/mail"
license=('MIT')
depends=('ruby' 'rubygems' 'ruby-i18n' 'ruby-mime-types' 'ruby-treetop')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('338dfc39e30665402aade821584970502e1e039fd972731fc95beff3991ad9a9')

package() {
  cd "${srcdir}"
  export HOME=/tmp
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem
}
