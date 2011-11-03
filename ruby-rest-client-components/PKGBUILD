# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux AT free DOT fr>
pkgname=ruby-rest-client-components
_gemname=rest-client-components
pkgver=1.2.0
pkgrel=1
pkgdesc="RestClient on steroids ! Easily add one or more Rack middleware around RestClient to add functionalities such as transparent caching (Rack::Cache), transparent logging, etc."
arch=(any)
url="https://rubygems.org/gems/rest-client-components"
license=(MIT)
depends=('ruby' 'ruby-rack' 'ruby-rest-client')
makedepends=(rubygems)
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem
        LICENSE )
noextract=($_gemname-$pkgver.gem)
md5sums=('b67ad73cf0df735df9d43130768c9043'
         '67fcbde014968f4c0a17482496878486')

build() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}

package() {
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
