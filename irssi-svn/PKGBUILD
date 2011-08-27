# Maintainer: J. W. Birdsong  <jwbirdsong AT gmail DOT com>
# Contributor: Lukasz Fidosz <virhilo@gmail.com>
# Contributor: Stavros Giannouris <stavrosg2002@freemail.gr>
# Contributor: SaintShakaJin <saintshakajin.3@laposte.net>


pkgname=irssi-svn
pkgver=5203
pkgrel=1
pkgdesc="Modular text mode IRC client with Perl scripting"
url="http://irssi.org/"
arch=('i686' 'x86_64')
license="GPL"
depends=('glib2' 'openssl' 'perl')
makedepends=('subversion' 'lynx' 'pkgconfig')
optdepends=('perl-libwww: used for scriptassist')
backup=(etc/irssi.conf)
conflicts=('irssi' 'irssi-cvs')
provides=('irssi')

_svntrunk=http://svn.irssi.org/repos/irssi/trunk
_svnmod=irssi

build() {
	cd ${srcdir}
	svn co $_svntrunk $_svnmod -r $pkgver
	msg "SVN checkout complete or svn timed out."
	msg "Starting make..."
	cd $_svnmod
	./autogen.sh --prefix=/usr \
                     --enable-ipv6 \
                     --with-proxy \
                     --sysconfdir=/etc \
		     --with-perl-lib=vendor
	make
	make DESTDIR=${pkgdir} install
	rm -rf  ${pkgdir}/usr/lib/perl5/core_perl/
}
