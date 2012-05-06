# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Adam Hani Schakaki (krzd) <krzd@krzd.net>

pkgname=ruby-gir-ffi
_pkgname=gir_ffi
pkgver=0.3.0
pkgrel=1
pkgdesc="FFI-based GObject binding using the GObject Introspection Repository"
arch=('any')
url="http://github.com/mvz/ruby-gir-ffi"
license=('LGPL')
depends=('ruby-ffi' 'ruby-indentation' 'gobject-introspection')
source=(http://rubygems.org/gems/$_pkgname-$pkgver.gem)
md5sums=('323ec97a8122f9db29cae49b08b652d3')
noextract=($_pkgname-$pkgver.gem)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_pkgname-$pkgver.gem
}
