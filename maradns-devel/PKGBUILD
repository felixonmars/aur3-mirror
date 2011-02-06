#######################
## Contributor: jiribb <jiribb@gmail.com>
## Little modifications for devel version: figue <ffigue at gmail>

pkgname=maradns-devel
_pkgname=maradns
pkgver=1.3.14
pkgrel=1
pkgdesc="A fast, secure, admin and IPv6 friendly name server - Development release"
arch=('i686')
url="http://www.maradns.org/"
license=('custom:AS-IS' 'custom:BSD')
groups=()
depends=('glibc')
makedepends=()
provides=('dns-server')
conflicts=('maradns')
replaces=()
backup=('etc/mararc')
options=()
install=maradns.install
source=(http://www.maradns.org/download/1.3/$pkgver/maradns-$pkgver.tar.bz2 mararc rc-maradns maradns.install)
md5sums=('cf54d12c5d95df6add88c7dbaa83ea11'
         '0368c452082f0b94ed0f75891ac650b8'
         'ab525d7f4b2ee935026d9f491872cc84'
         'efa4338ba6cb2907e571fc0307a1fdb0')


build() {

# prepare directories
mkdir -p $pkgdir/etc/{maradns,rc.d}
mkdir -p $pkgdir/usr/{bin,sbin,man/{man1,man5,man8},share/licenses/$_pkgname}

#build program
cd $srcdir/$_pkgname-$pkgver
./configure
make || return 1

#install license
install -D -m644 COPYING $pkgdir/usr/share/licenses/$_pkgname/copying

# install binaries
install -D -m755 server/maradns $pkgdir/usr/sbin/maradns
install -D -m755 tcp/getzone $pkgdir/usr/bin/getzone
install -D -m755 tcp/fetchzone $pkgdir/usr/bin/fetchzone
install -D -m755 tcp/zoneserver $pkgdir/usr/sbin/zoneserver
install -D -m755 tools/askmara $pkgdir/usr/bin/askmara
install -D -m755 tools/duende $pkgdir/usr/bin/duende

# install man-pages
install -D -m644 doc/en/man/askmara.1 $pkgdir/usr/man/man1/askmara.1
install -D -m644 doc/en/man/getzone.1 $pkgdir/usr/man/man1/getzone.1
install -D -m644 doc/en/man/fetchzone.1 $pkgdir/usr/man/man1/fetchzone.1
install -D -m644 doc/en/man/maradns.8 $pkgdir/usr/man/man8/maradns.8
install -D -m644 doc/en/man/zoneserver.8 $pkgdir/usr/man/man8/zoneserver.8
install -D -m644 doc/en/man/duende.8 $pkgdir/usr/man/man8/duende.8
install -D -m644 doc/en/man/csv1.5 $pkgdir/usr/man/man5/csv1.5
install -D -m644 doc/en/man/csv2.5 $pkgdir/usr/man/man5/csv2.5
install -D -m644 doc/en/man/csv2_txt.5 $pkgdir/usr/man/man5/csv2_txt.5
install -D -m644 doc/en/man/mararc.5 $pkgdir/usr/man/man5/mararc.5

# default configs
#install -D -m644 $srcdir/mararc $pkgdir/etc/mararc

cp $srcdir/mararc $startdir/pkg/etc/

install -D -m644 $srcdir/$_pkgname-$pkgver/doc/en/examples/example_csv2 $pkgdir/etc/maradns/db.example.net

# rc.d script
install -D -m755 $srcdir/rc-maradns $pkgdir/etc/rc.d/maradns

# create logger directory for duende daemonizing tool
mkdir $pkgdir/etc/maradns/logger
}
