# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: LeeF

pkgname=ruby-enterprise-rmagick
pkgver=2.13.1
pkgrel=3
pkgdesc="An interface to the ImageMagick and GraphicsMagick image processing libraries"
arch=('i686' 'x86_64')
url="http://rmagick.rubyforge.org/"
license=('MIT')
depends=('ruby-enterprise' 'imagemagick')
source=("http://gems.rubyforge.org/gems/${pkgname#ruby-enterprise-}-$pkgver.gem")
noextract=("${pkgname#ruby-enterprise-}-$pkgver.gem")
md5sums=('f528a83789c5abbe540b6227c08b2f5a')

build() {
	local _gemdir=`/opt/ruby-enterprise/bin/ruby -rubygems -e'puts Gem.default_dir'`
	gem install -Vl --no-user-install --ignore-dependencies \
		-i "$pkgdir$_gemdir" "$srcdir/${pkgname#ruby-enterprise-}-$pkgver.gem"
	sed -i "s/${pkgdir//\//\/}//" \
		"$pkgdir$_gemdir/doc/${pkgname#ruby-enterprise-}-$pkgver/rdoc/ext/RMagick/Makefile.html" \
		"$pkgdir$_gemdir/gems/${pkgname#ruby-enterprise-}-$pkgver/ext/RMagick/Makefile"
}
