# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux(at)free.fr>
# Based on ruby-rest-client PKGBUILD by Emiliano Vavassori <syntaxerrormmm(at)free.fr>

pkgname=ruby-restfully
_gemname=restfully
pkgver=0.8.8
pkgrel=1
pkgdesc="Consume RESTful APIs effortlessly"
arch=(any)
url="http://rubygems.org/gems/restfully"
license=('MIT')
depends=('ruby' 'ruby-rest-client>=1.6' 'ruby-rest-client-components' 'ruby-backports' 'ruby-json>=1.5.0' 'ruby-addressable' 'ruby-rack-cache')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem
        LICENSE)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('af78c954b40ba2f20e8a8bd30a4aacd9'
         'f5469b459b168af007cb61bb240aac13')

build() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies -i "$pkgdir$_gemdir" ${_gemname}-${pkgver}.gem
}

package() {
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
