# Maintainer: Stipe Kotarac <stipe at kotarac dot net>
_gemname=twurl
pkgname=$_gemname
pkgver=0.9.0
pkgrel=1
pkgdesc="Curl for the Twitter API"
arch=(any)
url="http://rubygems.org/gems/twurl"
license=('GPL')
depends=(ruby ruby-oauth)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('d4c35762103f9ed212c616b50c9a4db5')

package() {
	cd "$srcdir"
	local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

	gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
