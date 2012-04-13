# Maintainer: Sam Kleinman <sam+aur@tychoish.com>
# Last version visible on http://rubygems.org/gems/sahara
pkgname=ruby-sahara
gemname=sahara
pkgver=0.0.11
pkgrel=2
pkgdesc="Tool for sandboxing vagrant images"
arch=(any)
url="http://github.com/jedi4ever/sahara"
license=('MIT')
makedepends=('rubygems' 'rake')
makedepends=('rubygems' 'rake')
depends=('vagrant') 
source=(http://rubygems.org/downloads/${gemname}-${pkgver}.gem)
noextract=($pkgname-$pkgver.gem)
md5sums=('bb1285834ecc978d1aec6c944c0dcd97')

build() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir"/usr/bin $gemname-$pkgver.gem
}
