# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
_gemname=middleware
pkgname=ruby-$_gemname
pkgver=0.1.0
pkgrel=2
pkgdesc='Generalized implementation of the middleware abstraction for Ruby.'
arch=(any)
url='https://github.com/mitchellh/middleware'
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
md5sums=('1c5ec3073f4d098a365eb5e59accf2d0')
