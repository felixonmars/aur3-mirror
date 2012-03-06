# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
pkgname=ruby-enterprise-daemons
pkgver=1.1.8
pkgrel=1
pkgdesc="Daemons provides an easy way to wrap existing ruby scripts to be run as a daemon."
arch=(any)
url="http://daemons.rubyforge.org/"
license=('CUSTOM')
depends=('ruby-enterprise')
source=(http://gems.rubyforge.org/gems/daemons-$pkgver.gem)
noextract=(daemons-$pkgver.gem)

build() {
	cd "$srcdir"
	# _gemdir is defined inside build() because if ruby[gems] is not installed on the system
	# makepkg will exit with an error when sourcing the PKGBUILD
	local _gemdir="$(/opt/ruby-enterprise/bin/ruby -rubygems -e'puts Gem.default_dir')"

	/opt/ruby-enterprise/bin/gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" daemons-$pkgver.gem
}

md5sums=('f7b4b8b40ced9f5beb26b3353166f650')
