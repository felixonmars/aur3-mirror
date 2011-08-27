# $Id: PKGBUILD,v 1.45 2007/12/17 21:42:05 tom Exp $
# Maintainer: Marco Maso <demind@gmail.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>
# Contributor: wido <widomaker2k7@gmail.com>


pkgname=clamav-git
pkgver=20100923
pkgrel=1
pkgdesc="Anti-virus toolkit for Unix, GIT version."
arch=('i686' 'x86_64')
depends=('bzip2' 'zlib' 'gmp' 'curl' 'perl')
conflicts=('clamav' 'clamav-devel')
provides=('clamav')
install=$pkgname.install
license=('GPL')
backup=(etc/clamav/clamav.conf etc/clamav/clamd.conf etc/clamav/freshclam.conf etc/conf.d/clamav)
url=("http://www.clamav.net")
makedepends=('git')
source=(clamav
	clamav.confd
	clamav.logrotate)
md5sums=('4be868f0845b859479ec954ff0ddd930'
         '4c5fe97a8df3af5876246da388b5c7ba'
         '413bd6c865200eae42a10618f26dc124')

_gitroot="git://git.clamav.net/git/clamav-devel"
_gitname="clamav-devel"

build() {
msg "Connecting to gitorious.org GIT server...."

if [ -d $srcdir/$_gitname ] ; then
   cd $_gitname && git pull origin
   msg "The local files are updated."
else
   git clone $_gitroot
fi

msg "GIT checkout done or server timeout"
msg "Starting make..."

rm -rf $srcdir/$_gitname-build
cp -r $srcdir/$_gitname $srcdir/$_gitname-build
cd $srcdir/$_gitname-build

./configure --prefix=/usr --sysconfdir=/etc/clamav \
		--with-dbdir=/var/lib/clamav
	# will add clamav user with clamav.install
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1

	# make sure conf files get installed, cause make install
	# doesn't do that if clamav is already installed upon building.
	for i in clamd freshclam; do
		install -D -m644 etc/$i.conf $startdir/pkg/etc/clamav/$i.conf
	done
	
	install -D -m644 $startdir/src/clamav.confd $startdir/pkg/etc/conf.d/clamav
	install -D -m755 $startdir/src/clamav $startdir/pkg/etc/rc.d/clamav
	install -D -m644 $startdir/src/clamav.logrotate	$startdir/pkg/etc/logrotate.d/clamav

	# create log dirs/files & fix conf files.
	mkdir -p $startdir/pkg/var/log/clamav/
	mkdir -p $startdir/pkg/var/run/clamav/
	chown 64.root $startdir/pkg/var/log/clamav/
	chown 64.root $startdir/pkg/var/run/clamav/

	sed -i -e "s:\#LogFile /tmp/clamd.log:LogFile /var/log/clamav/clamd.log:" \
		-e "s:\#PidFile /var/run/clamd.pid:PidFile /var/run/clamav/clamd.pid:" \
		-e "s:\#User clamav:User clamav:" \
		-e "s:\#LogTime:LogTime:" \
		-e "s:\#TemporaryDirectory /var/tmp:TemporaryDirectory /tmp:" \
		-e "s:\LocalSocket /tmp/clamd.socket:LocalSocket /var/lib/clamav/clamd.sock:" \
		$startdir/pkg/etc/clamav/clamd.conf || return 1

	sed -i -e "s:\#UpdateLogFile /var/log/freshclam.log:UpdateLogFile /var/log/clamav/freshclam.log:" \
		-e "s:\#NotifyClamd /path/to/clamd.conf$:NotifyClamd /etc/clamav/clamd.conf:" \
		$startdir/pkg/etc/clamav/freshclam.conf || return 1

	# fix perms on virus database directory and un-distribute databases to require freshclam
	[ ! -f $startdir/pkg/var/lib/clamav/*.cvd ] || rm $startdir/pkg/var/lib/clamav/*.cvd
    mkdir -p $startdir/pkg/var/lib/clamav/
	chown 64:64 -R $startdir/pkg/var/lib/clamav/

	# install clamdwatch
	cd $srcdir/$_gitname-build/contrib/clamdwatch
	tar zxf clamdwatch.tar.gz
	sed -i -e 's@/var/run/clamd.ctl@/var/lib/clamav/clamd.sock@' \
	       -e 's@/var/lock/subsys/clamd@/var/run/clamav/clamd.pid@' \
	       -e 's@mkstemp( "/tmp/clamdwatch-XXXXXXXXXXXXXXXX" );@mkstemp( "/tmp/clamdwatch-XXXXXXXXXXXXXXXX" );\nchmod 0644, "$tempFile";@' clamdwatch || return 1

	install -D -m755 clamdwatch $startdir/pkg/usr/sbin/clamdwatch.pl || return 1
}

