# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-enterprise-bundler
pkgver=1.1.4
pkgrel=1
pkgdesc="Is manages an application's dependencies through its entire life, across many machines, systematically and repeatably."
arch=(any)
url="http://gembundler.com/"
license=('MIT')
depends=('ruby-enterprise')
source=(http://gems.rubyforge.org/gems/bundler-$pkgver.gem)
noextract=(bundler-$pkgver.gem)

build() {
	cd "$srcdir"
	# _gemdir is defined inside build() because if ruby[gems] is not installed on the system
	# makepkg will exit with an error when sourcing the PKGBUILD
	local _gemdir="$(/opt/ruby-enterprise/bin/ruby -rubygems -e'puts Gem.default_dir')"

	/opt/ruby-enterprise/bin/gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" bundler-$pkgver.gem
	mv "$pkgdir$_gemdir/bin" "$pkgdir/opt/ruby-enterprise/bin"
}

md5sums=('82dfe48d7ca8a28696e6a31e68d9015c')
