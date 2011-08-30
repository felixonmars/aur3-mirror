# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux(at)free.fr>

pkgname=ruby-grb
pkgver=0.4.1
pkgrel=1
pkgdesc="A tool to simplify working with (git) remote branches"
arch=(any)
url="https://rubygems.org/gems/grb"
license=('GPL')
depends=(ruby git)
makedepends=(rubygems)
source=(https://rubygems.org/downloads/grb-$pkgver.gem)
noextract=(grb-$pkgver.gem)
md5sums=('41b96bbdd26db1563fc2588c81c74f3e')

build() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --verbose -i "$pkgdir$_gemdir" -n "$pkgdir"/usr/bin grb-$pkgver.gem
}

# vim:set ts=2 sw=2 et:
