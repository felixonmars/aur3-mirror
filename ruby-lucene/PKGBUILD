# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au>

_gemname=lucene
pkgname=ruby-$_gemname
pkgver=0.5.0.beta.1
pkgrel=1
pkgdesc="A lucene wrapper for JRuby."
arch=(any)
url="http://github.com/andreasronge/lucene/"
license=('custom')
depends=(ruby) # Full dependency information is available in the yaml specification
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('489fbafcf75c179981cae92cec479c4b')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
