# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au>

_gemname=astrolabe
pkgname="ruby-$_gemname"
pkgver=1.3.0
pkgrel=1
pkgdesc="An object-oriented AST extension for Parser."
arch=(any)
url="https://github.com/yujinakayama/astrolabe"
license=('custom')
depends=(
  'ruby-parser<3.0.0'
)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('ea303766c0e9247362d217b6975bb856')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
