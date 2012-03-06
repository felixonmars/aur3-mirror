# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
pkgname=ruby-enterprise-stompserver
pkgver=0.9.9
pkgrel=4
pkgdesc="Stomp messaging server with file/dbm/memory/activerecord based FIFO queues, queue monitoring, and basic authentication."
arch=(any)
url="http://rubyforge.org/projects/stompserver/"
license=('MIT')
depends=('ruby-enterprise' 'ruby-enterprise-daemons' 'ruby-enterprise-eventmachine' 'ruby-enterprise-hoe')
source=(http://gems.rubyforge.org/gems/stompserver-$pkgver.gem stompserver.rc.d stompserver.conf)
noextract=(stompserver-$pkgver.gem)

build() {
	cd "$srcdir"
	# _gemdir is defined inside build() because if ruby[gems] is not installed on the system
	# makepkg will exit with an error when sourcing the PKGBUILD
	local _gemdir="$(/opt/ruby-enterprise/bin/ruby -rubygems -e'puts Gem.default_dir')"

	/opt/ruby-enterprise/bin/gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" stompserver-$pkgver.gem
	mv "$pkgdir$_gemdir/bin" "$pkgdir/opt/ruby-enterprise/bin"
	install -d -m0755 -o nobody -g nobody "$pkgdir/var/lib/stompserver"
	install -D -m0755 "$srcdir/stompserver.rc.d" "$pkgdir/etc/rc.d/stompserver"
	install -D -m0644 "$srcdir/stompserver.conf" "$pkgdir/etc/stompserver.conf"
}

md5sums=('736ea1e8940d885b42a744652fb56906'
         '37e6b3422d9d86b0a496b54bb623bc80'
         '68c66af98893619620e46a6909b3bb02')
