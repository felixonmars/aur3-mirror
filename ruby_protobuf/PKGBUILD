# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Josh Klar <j@iv597.com>

pkgname=ruby_protobuf
pkgver=0.4.11
pkgrel=1
pkgdesc="Google's protocol buffers for Ruby"
arch=('any')
url="https://github.com/macks/ruby-protobuf"
license=('custom')
depends=('ruby')
source=(http://gems.rubyforge.org/gems/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)

package() {
	cd "$srcdir"
	local _gemdir="$(/usr/bin/ruby -rubygems -e'puts Gem.default_dir')"

	/usr/bin/gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
		"$pkgname-$pkgver.gem"
}

sha256sums=('6464b5b992c584ef933c0dec2748c10f5fa4e22212278b2acfe068e4c14f405c')
