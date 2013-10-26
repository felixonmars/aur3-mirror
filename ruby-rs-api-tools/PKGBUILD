# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au>

_gemname=rs-api-tools
pkgname=ruby-$_gemname
pkgver=0.0.3
pkgrel=1
pkgdesc="RightScale API Command Line Tools."
arch=(any)
url="https://github.com/flaccid/rs-api-tools/"
license=('Apache 2')
depends=(ruby) # Full dependency information is available in the yaml specification
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('d8d7442f6f74d708445f649354eb6ff2')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
