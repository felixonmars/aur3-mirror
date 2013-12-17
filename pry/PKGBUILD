# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/pry/PKGBUILD

_gemname=pry
pkgname="$_gemname"
pkgver=0.9.12.4
pkgrel=2
pkgdesc="An IRB alternative and runtime developer console."
arch=(any)
url="http://pryrepl.org/"
license=('MIT')
depends=(
  'ruby'
  'ruby-coderay>=1.0.0'
  'ruby-method_source>=0.8.0'
  'ruby-slop>=3.4.0'
)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('eab474e5b6e9f41f4e5d1d200a7b3547')

package() {
  cd "$srcdir"

  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
