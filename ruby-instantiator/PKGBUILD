# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=ruby-instantiator
pkgver=0.0.6
pkgrel=1
pkgdesc="Instantiate an arbitrary Ruby class"
arch=('any')
url="http://dev.org/null"
license=('unknown')
depends=('ruby' 'ruby-blankslate')
source=("http://gems.rubyforge.org/gems/instantiator-${pkgver}.gem")
noextract=("instantiator-${pkgver}.gem")

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" instantiator-$pkgver.gem \
    -n "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
md5sums=('fbeecb9790701f04cbdf01ade64bf4a5')
