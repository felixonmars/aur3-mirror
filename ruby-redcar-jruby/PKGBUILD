# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid

_gemname=redcar-jruby
pkgname=ruby-$_gemname
pkgver=0.1
pkgrel=1
pkgdesc="Bundles the jruby jar so Redcar can use it."
arch=(any)
url="http://github.com/redcar/redcar-jruby"
license=('unknown')
depends=(ruby) # Full dependency information is available in the yaml specification
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('17486b231e7c224afa75a4e6fdb04c0f')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
