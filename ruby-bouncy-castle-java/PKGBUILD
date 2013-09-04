# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au>

_gemname=bouncy-castle-java
pkgname=ruby-$_gemname
pkgver=1.5.0147
pkgrel=1
pkgdesc="Gem redistribution of \"Legion of the Bouncy Castle Java cryptography APIs\" jars at http://www.bouncycastle.org/java.html"
arch=(any)
url="http://www.bouncycastle.org/java.html"
license=('MIT')
depends=(ruby) # Full dependency information is available in the yaml specification
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('44a35fefac55d137e6b0a0597f4b7688')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
