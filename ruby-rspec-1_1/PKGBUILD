# Contributor: Adam Russell <adamlr6+arch@gmail.com>
pkgname=ruby-rspec-1_1
pkgver=1.1.12
pkgrel=1
pkgdesc="Behaviour Driven Development for Ruby"
arch=('any')
url="http://rspec.info/"
license=('MIT')
depends=('ruby')
provides=('ruby-rspec')
source=(http://gems.rubyforge.org/gems/rspec-$pkgver.gem)
noextract=(rspec-$pkgver.gem)
md5sums=('0d3b6d97005546ed216708f580a516b5')

build() {
	cd "${srcdir}"
	local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
	gem install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin/" rspec-$pkgver.gem
}
