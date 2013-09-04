# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid

_gemname=spoon
pkgname=ruby-$_gemname
pkgver=0.0.4
pkgrel=2
pkgdesc="Spoon is an FFI binding of the posix_spawn function (and Windows equivalent), providing fork+exec functionality in a single shot."
arch=(any)
url="https://rubygems.org/gems/spoon"
license=('unknown')
depends=(ruby ruby-ffi)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('0263587d4c771d6198981071e2b62e63')

package() {
  cd "$srcdir"

  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
