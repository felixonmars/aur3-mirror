# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
pkgname=ruby-enterprise-eventmachine
pkgver=0.12.10
pkgrel=2
pkgdesc="EventMachine implements a fast, single-threaded engine for arbitrary network communications."
arch=(any)
url="http://rubyeventmachine.com/"
license=('GPL')
depends=('ruby-enterprise')
source=(http://gems.rubyforge.org/gems/eventmachine-$pkgver.gem)
noextract=(eventmachine-$pkgver.gem)

build() {
	cd "$srcdir"
	# _gemdir is defined inside build() because if ruby[gems] is not installed on the system
	# makepkg will exit with an error when sourcing the PKGBUILD
	local _gemdir="$(/opt/ruby-enterprise/bin/ruby -rubygems -e'puts Gem.default_dir')"

	/opt/ruby-enterprise/bin/gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" eventmachine-$pkgver.gem
}

md5sums=('1379ea93ad77132fb3756b492025f172')
