# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au>

_gemname=powerpack
pkgname="ruby-$_gemname"
pkgver=0.1.0
pkgrel=1
pkgdesc="A few useful extensions to core Ruby classes."
arch=(any)
url="https://github.com/bbatsov/powerpack"
license=('MIT')
depends=('ruby')
makedepends=(ruby)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('bec92f0b9efe9fcc1f3a17617e12e56e')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
