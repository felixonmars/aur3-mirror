# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid

_gemname=ruby-blockcache
pkgname=ruby-$_gemname
pkgver=0.2
pkgrel=1
pkgdesc="Cache implemented in Ruby that knows how to update its own contents."
arch=(any)
url="https://github.com/mscharley/ruby-blockcache"
license=('custom')
depends=(ruby)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('af79743ac5ea6be9e08bb8db822e5805')

package() {
  cd "$srcdir"

  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
