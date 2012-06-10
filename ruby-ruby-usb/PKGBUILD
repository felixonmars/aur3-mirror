# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=ruby-ruby-usb
pkgver=0.2.1
pkgrel=1
pkgdesc="A libusb binding library for Ruby."
arch=('i686' 'x86_64')
url="http://www.a-k-r.org/ruby-usb/"
license=("GPL")
depends=('ruby')
source=("http://gems.rubyforge.org/gems/${pkgname#ruby-}-$pkgver.gem")
noextract=("${pkgname#ruby-}-$pkgver.gem")
md5sums=('5d8fc3b87b7451d35837d0e329eb09a3')

package() {
	local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
	gem install -Vl --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$srcdir/${pkgname#ruby-}-$pkgver.gem"
	sed -i "s/${pkgdir//\//\/}//" "$pkgdir$_gemdir/gems/${pkgname#ruby-}-$pkgver/Makefile"
}
