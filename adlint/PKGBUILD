# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=adlint
pkgver=3.2.6
pkgrel=1
pkgdesc="A source code static analyzer"
arch=('any')
url="http://adlint.sourceforge.net/"
license=('GPL3')
depends=('ruby')
options=(!emptydirs)
source=("http://rubygems.org/downloads/${pkgname}-${pkgver}.gem")

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install --no-ri --no-rdoc -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}

md5sums=('870ac150030b3f37c4815ebc2b69ed55')
