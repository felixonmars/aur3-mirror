# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname='ruby-libarchive'
pkgver='0.1.2'
pkgrel='1'
pkgdesc='Ruby bindings for Libarchive, a programming library that can create and read several different streaming archive formats, including most popular tar variants, several cpio formats, and both BSD and GNU ar variants.'
arch=('i686' 'x86_64')
url='http://rubygems.org/gems/libarchive'
license=('GPL')
depends=('ruby')
source=("http://rubygems.org/downloads/${pkgname#ruby-}-$pkgver.gem")
md5sums=('f67dee2b229ee2fb96a17e2fdb0cf4d9')

package() {
	local _gemdir="$(/usr/bin/ruby -rubygems -e'puts Gem.default_dir')"
	/usr/bin/gem install -Vl --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$srcdir/${pkgname#ruby-}-$pkgver.gem"
	sed -i "s/${pkgdir//\//\/}//" "$pkgdir$_gemdir/gems/${pkgname#ruby-}-$pkgver/ext/"{Makefile,config.log,config.status}
}
