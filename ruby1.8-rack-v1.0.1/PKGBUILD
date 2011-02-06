# Contributor: Blaž Tomažič <blaz.tomazic@gmail.com>
pkgname=ruby1.8-rack-v1.0.1
pkgver=1.0.1
_realname="rack"
pkgrel=5
pkgdesc="a modular Ruby webserver interface"
arch=(any)
url="http://rack.rubyforge.org"
license=("GPL")m
depends=('ruby1.8')
makedepends=('rubygems1.8')
conflicts=('ruby1.8-rack')
provides=('ruby1.8-rack=1.0.1')
source=(http://gems.rubyforge.org/gems/rack-$pkgver.gem)
noextract=(rack-$pkgver.gem)

build() {
  cd $srcdir
  local _gemdir="$(ruby-1.8 -rubygems -e'puts Gem.default_dir')"
  gem-1.8 install --ignore-dependencies -i "$pkgdir$_gemdir" ${_realname}-$pkgver.gem
}
md5sums=('22268803c9b8b785ed30fcee5bce3ce7')
