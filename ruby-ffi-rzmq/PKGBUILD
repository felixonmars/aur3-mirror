# Maintainer: David Vogt <david.vogt@adfinis-sygroup.ch>
# This PKGBUILD is maintained at https://github.com/winged/aur-packages

_gemname=ffi-rzmq
pkgname=ruby-$_gemname
pkgver=2.0.4
pkgrel=1
pkgdesc="Ruby bindings for ZMQ"
arch=(any)
url="http://zeromq.org/bindings:ruby"
license=('LGPL')
depends=('ruby' 'zeromq')
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('bcb4f671c7e8cac821b5b4bcd1be089d')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
