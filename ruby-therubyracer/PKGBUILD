# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=therubyracer
pkgname=ruby-$_pkgname
pkgver=0.12.1
pkgrel=1
pkgdesc="Call JavaScript code and manipulate JavaScript objects from Ruby. Call Ruby code and manipulate Ruby objects from JavaScript."
arch=("any")
url="https://github.com/cowboyd/therubyracer"
license=("MIT")
depends=("ruby" "ruby-libv8" "ruby-ref")
makedepends=("rubygems")
source=("http://gems.rubyforge.org/gems/$_pkgname-$pkgver.gem")
noextract=("$_pkgname-$pkgver.gem")
sha256sums=("26565ce91657acb5d0921584cace7ee82723452d747d66ee8154298f6bc4ce80")

package() {
	cd "$srcdir"
	local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_pkgname-$pkgver.gem"
}
