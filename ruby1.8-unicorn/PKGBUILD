# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=ruby1.8-unicorn
pkgver=4.2.0
pkgrel=4
pkgdesc="An HTTP server for Rack applications designed to only serve fast clients on low-latency, high-bandwidth connections and take advantage of features in Unix/Unix-like kernels"
arch=('i686' 'x86_64')
url="http://unicorn.bogomips.org/"
license=("GPL")
depends=('ruby1.8' 'rubygems1.8' 'ruby1.8-rack' 'ruby1.8-kgio' 'ruby1.8-raindrops')
source=("http://gems.rubyforge.org/gems/${pkgname#ruby1.8-}-$pkgver.gem")
noextract=("${pkgname#ruby1.8-}-$pkgver.gem")
md5sums=('fb65211bc77acf0dcdbc903f252ff9a2')

package() {
	local _gemdir="$(ruby-1.8 -rubygems -e'puts Gem.default_dir')"
	gem-1.8 install --no-user-install --ignore-dependencies -Vi "$pkgdir$_gemdir" "$srcdir/${pkgname#ruby1.8-}-$pkgver.gem"
	sed -i "s/${pkgdir//\//\/}//" "$pkgdir$_gemdir/gems/${pkgname#ruby1.8-}-$pkgver/ext/unicorn_http/Makefile"
}
