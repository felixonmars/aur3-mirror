# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid

_gemname=redcar-javamateview
pkgname=ruby-$_gemname
pkgver=0.2
pkgrel=1
pkgdesc="A source editing widget for SWT that understands Textmate syntaxes and themes."
arch=(any)
url="https://github.com/danlucraft/java-mateview"
license=('unknown')
depends=(ruby) # Full dependency information is available in the yaml specification
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('1762a9ae6fbf5bf25fca48ce8db50d27')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
