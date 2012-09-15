# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
_gemname=sourcify
pkgname=ruby-$_gemname
pkgver=0.5.0
pkgrel=2
pkgdesc="Workarounds before ruby-core officially supports Proc.to_source (& friends)."
arch=(any)
url="http://github.com/ngty/sourcify"
license=(MIT)
depends=(ruby ruby-file-tail ruby-ruby2ruby ruby-ruby_parser ruby-sexp_processor)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('aaee23896aae34909f0937bacbbec992')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
