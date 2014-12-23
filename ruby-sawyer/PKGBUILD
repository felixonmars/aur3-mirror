# $Id$
# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Package Build Source: https://github.com/flaccid/archlinux-packages/blob/master/ruby-sawyer/PKGBUILD

_gemname=sawyer
pkgname=ruby-$_gemname
pkgver=0.6.0
pkgrel=1
pkgdesc="Secret User Agent of HTTP."
arch=(any)
url="https://github.com/lostisland/sawyer"
license=('MIT')
depends=(
  ruby
  ruby-addressable
  ruby-faraday
)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('eebf769957c8c0fac35cdf1885287dc9')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
