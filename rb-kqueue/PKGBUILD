# Maintainer: Sid Karunaratne <sid@karunaratne.net>
pkgname=rb-kqueue
pkgver=0.2.0
pkgrel=1
pkgdesc="A Ruby wrapper for BSD's kqueue, using FFI"
arch=('any')
url="https://rubygems.org/gems/rb-kqueue"
license=('MIT')
depends=('ruby-ffi')
makedepends=('rubygems' 'ruby-yard')
source=("http://gems.rubyforge.org/gems/${pkgname}-${pkgver}.gem")
noextract=("${pkgname}-${pkgver}.gem")

build() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" --no-user-install \
              ${pkgname}-$pkgver.gem -n "$pkgdir/usr/bin"
}

md5sums=('c958ec6c886e877a1f4d4723332c1883')

# vim:set ts=2 sw=2 et:
