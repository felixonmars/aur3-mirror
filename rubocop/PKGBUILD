# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au>

_gemname=rubocop
pkgname="$_gemname"
pkgver=0.29.1
pkgrel=1
pkgdesc="RuboCop is a Ruby static code analyzer. Out of the box it will enforce many of the guidelines outlined in the community Ruby Style Guide."
arch=(any)
url="https://github.com/bbatsov/rubocop"
license=('custom')
depends=(
  'ruby-astrolabe>=1.3.0'
  'ruby-parser<3.0.0'
  'ruby-powerpack>=0.1.0'
  'ruby-ruby-progressbar>=1.4.0'
  'ruby-rainbow<3.0.0'
)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('ad5516f86080962a4823bd2bc5ec4f15')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
