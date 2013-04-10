# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>

pkgname=ruby-rubypants
pkgver=0.2.0
_realname="rubypants"
pkgrel=3
pkgdesc="RubyPants is a Ruby port of the smart-quotes library SmartyPants."
arch=('any')
url="https://rubygems.org/gems/rubypants"
license=("CUSTOM")
depends=('ruby')
source=(http://gems.rubyforge.org/gems/$_realname-$pkgver.gem
        LICENSE )
md5sums=('ab0d32049479f460b2545ec4ae37bacf'
         '6900b692c03adcee639e977c8c084b06')
noextract=($real_name-$pkgver.gem)

package() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" ${_realname}-$pkgver.gem

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

