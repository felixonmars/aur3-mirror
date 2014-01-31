# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/chef-zero/PKGBUILD

_gemname=chef-zero
pkgname=$_gemname
pkgver=2.0.2
pkgrel=1
pkgdesc="Self-contained, easy-setup, fast-start in-memory Chef server for testing and solo setup purposes."
arch=(any)
url="https://github.com/jkeiser/chef-zero"
license=('Apache 2.0')
depends=(
  'ruby'
  'ruby-hashie>=2.0.0'
  'ruby-json'
  'ruby-mixlib-log>=1.3'
  'ruby-rack'
)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('a8202ed93d79152e65d6d13661fcdf3f')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
