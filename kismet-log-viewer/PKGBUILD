## Kismet Log Suite
# Contributor: nofxx <x@nofxx.com>
pkgname=kismet-log-viewer
pkgver=0.9.7
pkgrel=1
pkgdesc="KLV takes Kismet .xml log files and produces a nicely formatted html interface to browse the logs with."
arch=('i686' 'x86_64')
url="http://www.mindflip.org/klv"
license=('GPL')
depends=('perl' 'perl-libxml')
provides=(klv)
conflicts=(klv)
install=
source=(http://www.mindflip.org/klv/$pkgname-$pkgver.tar.gz)
md5sums=('d9d878690e807477a918b2292946993f')

build() {
	cd $startdir/src/$pkgname-$pkgver

	# dutch faster script
	# http://kismetwireless.net/Forum/General/Messages/1158427772.6155391
	# 'http://kismetwireless.net/code/klc_dutch_08-2006-R2.pl'
	install -m 755 -D $startdir/klc_dutch_08-2006-R2.pl $startdir/pkg/usr/share/klv/klc.pl || return 1
        # or vanilla one:
	#install -m 755 -D klc.pl $startdir/pkg/usr/share/klv || return 1
	install -m 755 -D klv.pl $startdir/pkg/usr/share/klv || return 1
	install -m 755 -D logo.png $startdir/pkg/usr/share/klv || return 1
	install -m 644 -D ap_manuf $startdir/pkg/usr/share/klv || return 1
	install -m 644 -D client_manuf $startdir/pkg/usr/share/klv || return 1

	msg "Executables will be 'klv' and 'klc'..."
	mkdir $startdir/pkg/usr/bin
	ln -s /usr/share/klv/klv.pl $startdir/pkg/usr/bin/klv || return 1
        ln -s /usr/share/klv/klc.pl $startdir/pkg/usr/bin/klc || return 1
	}
