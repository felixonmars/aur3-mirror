# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
_gemname=raspell
pkgname=ruby-enterprise-raspell
pkgver=1.3
pkgrel=1
pkgdesc="An interface binding for the Aspell spelling checker."
arch=(any)
url="http://sourceforge.net/projects/raspell/"
license=('GPL')
depends=('ruby-enterprise' 'aspell')
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

build() {
	cd "$srcdir"
	# _gemdir is defined inside build() because if ruby[gems] is not installed on the system
	# makepkg will exit with an error when sourcing the PKGBUILD
	local _gemdir="$(/opt/ruby-enterprise/bin/ruby -rubygems -e'puts Gem.default_dir')"
	/opt/ruby-enterprise/bin/gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
	find "$pkgdir$_gemdir/gems/$_gemname-$pkgver/ext/" -type f ! -name "*.so" -delete
}

md5sums=('c04a6540c0b5980a5d58efd9be5ba76f')
