# Maintainer: Sirat18 <aur@sirat18.de>
# Contributer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=libv8
pkgname=ruby-$_pkgname
pkgver=3.16.14.8.rc1
pkgrel=1
pkgdesc="Ruby gem binary distribution of the V8 JavaScript engine"
arch=("i686" "x86_64")
url="https://github.com/cowboyd/libv8"
license=("MIT")
depends=("python2")
makedepends=("rubygems")
source=("http://gems.rubyforge.org/gems/$_pkgname-$pkgver.gem")
noextract=("$_pkgname-$pkgver.gem")
sha256sums=('e765ad2be7e25c0450d6779283968c054ce014a172300d67bc02a847c3046d63')
options=("staticlibs")

package() {
	cd "$srcdir"
	local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_pkgname-$pkgver.gem"
}
