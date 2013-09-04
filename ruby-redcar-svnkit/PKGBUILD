# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid

_gemname=redcar-svnkit
pkgname=ruby-$_gemname
pkgver=0.2
pkgrel=1
pkgdesc="Bundles the svnkit jar so Redcar can use it."
arch=(any)
url="http://github.com/redcar/redcar-svnkit"
license=('TMat,MIT')
depends=(ruby) # Full dependency information is available in the yaml specification
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('db6b1d08ae27ecee6d10606084ae6d07')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
