# Maintainer: Sid Karunaratne <sid@karunaratne.net>
pkgname=rb-fsevent
pkgver=0.9.3
pkgrel=1
pkgdesc="FSEvents API with Signals catching (without RubyCocoa)"
arch=('any')
url="https://rubygems.org/gems/rb-fsevent"
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

md5sums=('cb7239732c139c1ed51b19b0cda9f1be')

# vim:set ts=2 sw=2 et:
