# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/puma/PKGBUILD

_gemname=puma
pkgname="$_gemname"
pkgver=2.6.0
pkgrel=1
pkgdesc="Puma is a simple, fast, threaded, and highly concurrent HTTP 1.1 server for Ruby/Rack applications."
arch=(any)
url="http://puma.io/"
license=('BSD')
depends=(ruby)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('e502fbaf988020e50812390366ee343e')

package() {
  cd "$srcdir"

  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
