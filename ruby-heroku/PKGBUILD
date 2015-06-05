# Contributor: Emiliano Vavassori <syntaxerrormmm(at)gmail.com>
# Maintainer: Emiliano Vavassori <syntaxerrormmm(at)gmail.com>
pkgname=ruby-heroku
_gemname=heroku
pkgver=3.37.6
pkgrel=1
pkgdesc="Deploy apps to Heroku from the command line"
arch=(any)
url="http://github.com/heroku/heroku"
license=('MIT')
depends=('ruby' 'ruby-heroku-api>=0.3.19' 'ruby-netrc>=0.10.0' 'ruby-launchy>=0.3.2' 'ruby-rest-client>=1.6.0' 'ruby-rubyzip>=0.9.9' 'ruby-multi_json>=1.10')
makedepends=('ruby')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('da6f52f462a962608956b6d6e8c4bcca')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  install -d "${pkgdir}/usr/bin"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
}
