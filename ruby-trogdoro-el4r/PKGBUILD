# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
_gemname=trogdoro-el4r
pkgname=ruby-$_gemname
pkgver=1.0.7
pkgrel=1
pkgdesc="El4r enables you to write Emacs programs in Ruby(EmacsRuby) as well as in EmacsLisp."
arch=(any)
url="http://rubygems.org/gems/trogdoro-el4r"
license=(unknown)
depends=(ruby)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('c1238bed0cec3d2acd40bf7406b5e8b1')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
