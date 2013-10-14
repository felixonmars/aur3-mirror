# Maintainer:  Matthew Monaco <net 0x01b matt>
# Contributor: Rogof <com gmail fake.bios>

_gemname=gherkin
pkgname=ruby-$_gemname
pkgver=2.12.2
pkgrel=3
pkgdesc="A fast Gherkin lexer/parser based on the Ragel State Machine Compiler"
arch=(any)
url="https://github.com/cucumber/gherkin"
license=(GPL)
depends=(ruby ruby-multi_json)
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=(051e9965eae582ec354263a8da758dfb)

package() {

	cd "$srcdir"
	local _gemdir=$(ruby -rubygems -e'puts Gem.default_dir')
	gem install --no-user-install --ignore-dependencies --verbose \
	            -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
	            "$_gemname-$pkgver.gem"
}

# vim: set noet :
