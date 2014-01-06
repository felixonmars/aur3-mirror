# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=adlint
pkgver=3.2.0
pkgrel=1
pkgdesc="A source code static analyzer"
arch=('any')
url="http://adlint.sourceforge.net/"
license=('GPL3')
depends=('ruby')
source=("http://rubygems.org/downloads/${pkgname}-${pkgver}.gem")

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install --no-ri --no-rdoc -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
	rmdir "$pkgdir/$_gemdir/cache"
	rmdir "$pkgdir/$_gemdir/doc"
	rmdir "$pkgdir/$_gemdir/build_info"
}

md5sums=('b12b2ad3b35483552fbe88973ea91458')
