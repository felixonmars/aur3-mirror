# Maintainer: Your Name <youremail@domain.com>

_gemname=gisty
pkgname=ruby-$_gemname
pkgver=0.2.3
pkgrel=1
pkgdesc="Yet another command line client for gist"
arch=(any)
url="http://rubygems.org/gems/gisty"
license=('GPL')
depends=(ruby) # Full dependency information is available in the yaml specification
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('e8c5c2f6e320cd0378f4817c76a393a7')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
