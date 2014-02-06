# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au>

_gemname=right_api_client
pkgname=ruby-$_gemname
pkgver=1.5.15
pkgrel=1
pkgdesc="The right_api_client gem simplifies the use of RightScale's MultiCloud API. It provides a simple object model of the API resources, and handles all of the fine details involved in making HTTP calls and translating their responses."
arch=(any)
url="https://github.com/rightscale/right_api_client/"
license=('Apache 2')
depends=(
  ruby
  ruby-json
  ruby-rest-client
)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('f70dcfcee85b26cbd1eecf4d57c563a4')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
