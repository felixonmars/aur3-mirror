# Contributor: henning mueller <henning@orgizm.net>
pkgname=ejabberd-svn
pkgver=1560
pkgrel=1
pkgdesc="An erlang jabber server. Modules mod_archive, mysql, pgsql and ircd included."
url="http://www.ejabberd.im"
arch=(i686 x86_64)
license=(GPL)
depends=(erlang expat openssl zlib pam)
makedepends=(subversion)
conflicts=(ejabberd ejabberd-mod_archive-svn)
install=$pkgname.install
source=(\
	ejabberd-makefile.patch \
	ejabberd-rc-script.sh \
	$pkgname.install
)
md5sums=(
	d363229c3cf6451636d396391aed9e01
	5c16e28b6b84bee39a9f55fa1728112b
	0b6e07bb33e99151c039f62e6d0a8186
)

_svn0=http://svn.process-one.net/ejabberd/trunk
_svn0mod=ejabberd
_svn0rv=$pkgver

_svn1=http://svn.process-one.net/ejabberd-modules
_svn1mod=ejabberd-modules
_svn1rv=711

build() {
	cd $srcdir

# check out repositories
	[ -d $_svn0mod/.svn ] &&
		(cd $_svn0mod && svn up -r $_svn0rv) ||
		svn co $_svn0 --config-dir ./ -r $_svn0rv $_svn0mod

	[ -d $_svn1mod/.svn ] &&
		(cd $_svn1mod && svn up -r $_svn1rv) ||
		svn co $_svn1 --config-dir ./ -r $_svn1rv $_svn1mod

# temporary build directories
	cp -r $_svn0mod $_svn0mod-build
	cp -r $_svn1mod $_svn1mod-build

# build and install ejabberd trunk
	cd $_svn0mod-build/src
	patch -p1 < $startdir/ejabberd-makefile.patch

	./configure --enable-odbc --enable-pam --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1

	make || return 1
	make DESTDIR=$pkgdir install

	install -D -m755 $startdir/ejabberd-rc-script.sh $pkgdir/etc/rc.d/ejabberd
	install -d $pkgdir/usr/share/doc/ejabberd/sql
	install odbc/{mysql,pg}.sql $pkgdir/usr/share/doc/ejabberd/sql
	install -d $pkgdir/var/spool/ejabberd

# build and install ejabberd modules
	cd $srcdir/$_svn1mod-build
	for _module in {mod_archive,mysql,pgsql,ircd}; do
		cd $_module/trunk
		./build.sh
		install ebin/*.beam $pkgdir/usr/lib/ejabberd/ebin
		cd ../..
	done

	install mod_archive/trunk/src/*.sql $pkgdir/usr/share/doc/ejabberd/sql

# clean up
	rm -rf $srcdir/*-build
}
