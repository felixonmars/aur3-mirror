# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid

_gemname=plugin_manager
pkgname=ruby-$_gemname
pkgver=1.5
pkgrel=1
pkgdesc="A Ruby plugin loader."
arch=(any)
url="http://github.com/danlucraft/plugin_manager"
license=('MIT')
depends=(ruby) # Full dependency information is available in the yaml specification
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('6a9a3f17eebb64b588bc8817818aa0b5')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
