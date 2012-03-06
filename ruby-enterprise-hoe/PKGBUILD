# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
pkgname=ruby-enterprise-hoe
pkgver=2.15.0
pkgrel=1
pkgdesc="Hoe is a rake/rubygems helper for project Rakefiles."
arch=(any)
url="http://rubyforge.org/projects/seattlerb/"
license=('MIT')
depends=('ruby-enterprise' 'ruby-enterprise-rake')
source=(http://gems.rubyforge.org/gems/hoe-$pkgver.gem)
noextract=(hoe-$pkgver.gem)

build() {
	cd "$srcdir"
	# _gemdir is defined inside build() because if ruby[gems] is not installed on the system
	# makepkg will exit with an error when sourcing the PKGBUILD
	local _gemdir="$(/opt/ruby-enterprise/bin/ruby -rubygems -e'puts Gem.default_dir')"

	/opt/ruby-enterprise/bin/gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" hoe-$pkgver.gem
}

md5sums=('2725177faa53be082483402b6e867ad5')
