# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=ruby1.8-raindrops
pkgver=0.8.0
pkgrel=1
pkgdesc="A real-time stats toolkit to show statistics for Rack HTTP servers"
arch=('i686' 'x86_64')
url="http://raindrops.bogomips.org/"
license=("GPL")
depends=('ruby1.8' 'rubygems1.8')
source=("http://gems.rubyforge.org/gems/${pkgname#ruby1.8-}-$pkgver.gem")
noextract=("${pkgname#ruby1.8-}-$pkgver.gem")
md5sums=('f1b590d3718c41002c282863f60bdf82')

package() {
	local _gemdir="$(ruby-1.8 -rubygems -e'puts Gem.default_dir')"
	gem-1.8 install -Vl --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" "$srcdir/${pkgname#ruby1.8-}-$pkgver.gem"
	sed -i "s/${pkgdir//\//\/}//" "$pkgdir$_gemdir/gems/${pkgname#ruby1.8-}-$pkgver/ext/${pkgname#ruby1.8-}/Makefile"
}
