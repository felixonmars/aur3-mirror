# Maintainer: Josh Klar <j@iv597.com>
# Contributor: Joel Almeida <aullidolunar at gmail dot c0m>

pkgname=ruby-audio
pkgver=1.6.1
pkgrel=2
pkgdesc="Wrapper around libsndfile to provide simplified sound reading and writing support for Ruby"
arch=("any")
url="http://rubygems.org/gems/ruby-audio"
license=('GPL')
depends=("ruby" "libsndfile")
source=("https://rubygems.org/downloads/$pkgname-$pkgver.gem")
noextract=('$pkgname-$pkgver.gem')
md5sums=('d4f5cea4c14190ca67231a0349b6e141')

package() {
	cd "$srcdir"
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
	install -Dm644 "$pkgdir$_gemdir/gems/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE"
}

build() {
	cd "$srcdir"
}
