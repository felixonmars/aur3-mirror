# Maintainer: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Aliaksiej Artamonaŭ <aliaksiej.artamonau@gmail.com>

pkgname=ruby-compass-alpha
pkgver=1.0.0.alpha.19
_gemfile="compass-${pkgver}.gem"
pkgrel=2
pkgdesc="A Real Stylesheet Framework"
arch=(any)
url="http://compass-style.org"
license=("MIT")
options=("!emptydirs")
depends=("ruby" "ruby-compass-core=${pkgver}" "ruby-compass-import-once" "ruby-sass" "ruby-chunky_png" "ruby-json" "ruby-listen-1.1")
makedepends=("rubygems")
conflicts=("ruby-compass")
source=("http://gems.rubyforge.org/gems/${_gemfile}")
noextract=($_gemfile)

package() {
	cd "$srcdir"
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemfile
	rm "$pkgdir/$_gemdir/cache/$_gemfile"

	install -d -m755 "$pkgdir/usr/share/licenses/$pkgname"
	install -D "$pkgdir$_gemdir/gems/compass-$pkgver/LICENSE.markdown" \
	           "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('83647b73510af259898251f2975e22f0e9fad0c4fcf14f2a002fb236447f72ef')
