# Maintainer: kozec <kozec-at-kozec-dot-com>
pkgname=portfwd
pkgver=0.29
pkgrel=1
license='GPL2'
arch=('i686' 'x86_64')
pkgdesc="Portfwd is an user-level tool which forwards incoming TCP connectionsand/or UDP packets to remote hosts"
url="http://sourceforge.net/projects/portfwd/"
source=("http://garr.dl.sourceforge.net/project/portfwd/portfwd/$pkgver/portfwd-$pkgver.tar.gz"
	"portfwd.daemon"
	"default_config.conf"
	)
install="portfwd.install"
backup=(etc/portfwd.cfg)
md5sums=('93161c91e12b0d67ca52dc13708a2f2f'
         'b0bcb631f96d2bc5fb70f25c7a3ab991'
         '668728d5bdb97d62a4032e670b5f1138')

build() {
 cd portfwd-$pkgver
 ./bootstrap
 ./configure --prefix=/usr --sysconfdir=/etc || return 1
 make || return 1
 make DESTDIR=$startdir/pkg install || return 1
 mkdir -p "$pkgdir/etc/rc.d"
 install -m 755 "$srcdir/portfwd.daemon" "$pkgdir/etc/rc.d/portfwd"
 install -m 644 "$srcdir/default_config.conf" "$pkgdir/etc/portfwd.cfg"
}
