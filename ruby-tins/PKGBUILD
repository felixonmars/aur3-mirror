# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Source: https://github.com/nicoulaj/archlinux-packages
_gemname=tins
pkgname=ruby-$_gemname
pkgver=0.8.3
pkgrel=1
pkgdesc="All the stuff that isn't good/big enough for a real library."
arch=(any)
url="https://github.com/flori/tins"
license=(MIT)
depends=(ruby)
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('27b443c5c752f8b443316a6c21f60288')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
