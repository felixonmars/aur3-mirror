# Contributor: thoughtcrime
#
# NOTE: if you use wine inside a arch32 chroot, 
# install this package inside arch32 and run
# the following in arch64:
# ln -s /opt/arch32/usr/share/ghostship/ghostship_chroot /etc/rc.d/ghostship
#

pkgname=ghostship-svn
pkgver=42
pkgrel=1
pkgdesc="A bash daemon that executes the Windows proxy 'Ultrasurf' like a unix daemon"
arch=(i686 x86_64)
url="http://ghostship.sourceforge.net/"
license=('GPL')
groups=()
depends=('tightvnc' 'wget')
makedepends=('subversion')
optdepends=('wine' 'bin32-wine')
provides=('ghostship')
conflicts=('ghostship' 'ghostship-test')
replaces=()
backup=('/etc/ghostship/ghostship.conf')
options=(!zipman)
install=
noextract=()


_svntrunk="https://ghostship.svn.sourceforge.net/svnroot/ghostship "
_svnmod="ghostship"

build() {
	cd "$srcdir"

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_svnmod-build"
	cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
	cd "$srcdir/$_svnmod-build"

	#
	# BUILD
	#

	svndir="$srcdir/ghostship-build"
	
	install -d $pkgdir/etc/rc.d
	install -d $pkgdir/etc/ghostship
	install -d $pkgdir/usr/bin
	install -d $pkgdir/usr/share/man/man1
	install -d $pkgdir/var/lib/ghostship/status
	
	cp $svndir/initscripts/archlinux/ghostship $pkgdir/etc/rc.d/ghostship
	cp $svndir/source/etc/ghostship/ghostship.conf $pkgdir/etc/ghostship/
	cp $svndir/source/etc/ghostship/password.conf $pkgdir/etc/ghostship/
	cp $svndir/source/usr/bin/ghostship $pkgdir/usr/bin/
	cp $svndir/source/usr/share/man/man1/ghostship.1 $pkgdir/usr/share/man/man1/
	cp $svndir/source/var/lib/ghostship/status/*.png $pkgdir/var/lib/ghostship/status/
	cp $svndir/source/var/lib/ghostship/status/start.html $pkgdir/var/lib/ghostship/status/
	
	# Copy the init script for chroot users
	if [ "$CARCH" = "i686" ]; then
		install -d $pkgdir/usr/share/ghostship/
		cp $svndir/initscripts/archlinux/ghostship_chroot $pkgdir/usr/share/ghostship/
	fi
}

# vim:set ts=2 sw=2 et:
