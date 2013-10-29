# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/ruby-swt/PKGBUILD

_gemname=swt
pkgname=ruby-$_gemname
pkgver=0.18
pkgrel=1
pkgdesc="Contains everything required to write cross-platform desktop applications with JRuby and SWT."
arch=(any)
url="http://github.com/danlucraft/swt"
license=('custom')
depends=('ruby' 'swt') # Full dependency information is available in the yaml specification
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('5340682de8bb90ef02b009458931471f')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
