# Maintainer: Marco Desiderati <negher@negher.net>
_gemname=rack-contrib
pkgname=ruby-$_gemname
pkgver=1.1.0
pkgrel=1
pkgdesc="Contributed Rack Middleware and Utilities"
arch=(any)
url="http://github.com/rack/rack-contrib/"
license=('GPL')
depends=(ruby
         'ruby-rack>=0.9.1') # Full dependency information is available in the yaml specification
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('ac0c3418c27bb1bbce4ca9c2178eecf5')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
