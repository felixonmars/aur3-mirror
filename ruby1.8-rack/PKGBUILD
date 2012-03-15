# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Jacek Roszkowski <j.roszk@gmail.com>

pkgname=ruby1.8-rack
pkgver=1.4.1
pkgrel=1
pkgdesc="A minimal interface between webservers supporting Ruby and Ruby frameworks"
arch=('any')
url="http://rack.rubyforge.org"
license=("GPL")
depends=('ruby1.8' 'rubygems1.8')
source=("http://gems.rubyforge.org/gems/${pkgname#ruby1.8-}-$pkgver.gem")
noextract=("${pkgname#ruby1.8-}-$pkgver.gem")
md5sums=('a278fe5208c2412b724d6eac432e2807')

build() {
	local _gemdir="$(ruby-1.8 -rubygems -e'puts Gem.default_dir')"
	gem-1.8 install -Vl --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" "$srcdir/${pkgname#ruby1.8-}-$pkgver.gem"
}
