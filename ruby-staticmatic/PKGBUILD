# Maintainer: Ricardo Wurmus <maintainer's full name at gmail com>
pkgname=ruby-staticmatic
pkgver=0.11.1
pkgrel=1
pkgdesc="Liteweight Static Site Framework"
arch=(any)
url="http://staticmatic.rubyforge.org/"
license=('MIT')
depends=(ruby)
makedepends=(rubygems)
source=(http://rubygems.org/downloads/staticmatic-$pkgver.gem)
noextract=(staticmatic-$pkgver.gem)
md5sums=('fe73535b0805aa1521916b70af4f8f2d')

build() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --verbose -i "$pkgdir$_gemdir" -n "$pkgdir"/usr/bin staticmatic-$pkgver.gem
}
