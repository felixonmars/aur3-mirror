# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
_gemname=sexp_processor
pkgname=ruby-$_gemname-3.0
pkgver=3.0.10
pkgrel=1
pkgdesc="sexp_processor branches from ParseTree bringing all the generic sexp processing tools with it."
arch=(any)
url="https://github.com/seattlerb/sexp_processor"
license=(MIT)
depends=(ruby)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('59879e85f0e55cda9728efefe075e9d0')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
