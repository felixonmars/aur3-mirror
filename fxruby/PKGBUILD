# Contributor: Christoph 'delmonico' Neuroth <delmonico@gmx.net>
# Contributor: Eric Forgeot < http://ifiction.free.fr >
# Maintainer: Sean Bartell <wingedtachikoma@gmail.com>
_gemname=fxruby
pkgname=fxruby
pkgver=1.6.25
pkgrel=1
pkgdesc="FXRuby is a Ruby extension module that provides an interface to the FOX GUI library."
url="http://www.fxruby.org/"
license="LGPL"
arch=(i686 x86_64)
depends=(fox ruby)
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('ae04eed5ed2591c19b302e9d2b66c64d')
sha256sums=('1a2bd0e74e9138df8004ddec006a7dd99646c08d68892898f0d6238e33e47a12')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    $pkgname-$pkgver.gem
}
