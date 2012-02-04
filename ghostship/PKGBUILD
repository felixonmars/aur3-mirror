# Contributor: thoughtcrime
#
# NOTE: if you use wine inside a arch32 chroot, 
# install this package inside arch32 and run
# the following in arch64:
# ln -s /opt/arch32/usr/share/ghostship/ghostship_chroot /etc/rc.d/ghostship
#

pkgname=ghostship
pkgver=0.6
pkgrel=1
pkgdesc="A bash daemon that executes the Windows proxy 'Ultrasurf' like a unix daemon"
arch=(i686 x86_64)
url="http://ghostship.sf.net/"
license=('GPL')
groups=()
depends=('tightvnc' 'wget')
makedepends=()
optdepends=('wine' 'bin32-wine')
provides=()
conflicts=('ghostship-svn' 'ghostship-test')
replaces=()
backup=('/etc/ghostship/ghostship.conf')
options=(!zipman)
install=
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('4ff7dbbf7082b8c6d5806a843b125029')



build() {
	cp $srcdir/$pkgname-$pkgver/source/* "$pkgdir" -r
	mkdir "$pkgdir/etc/rc.d/" -p
	cp "$srcdir/$pkgname-$pkgver/initscripts/archlinux/ghostship" "$pkgdir/etc/rc.d/"
	
	# Copy the init script for chroot users
	if [ "$CARCH" = "i686" ]; then
		install -d "$pkgdir/usr/share/ghostship/"
		cp "$srcdir/$pkgname-$pkgver/initscripts/archlinux/ghostship_chroot" "$pkgdir/usr/share/ghostship/"
	fi
	
	# Remove other distros specific stuff
	rm "$pkgdir/var/lib/ghostship/status/ubuntu.html"
	
}

# vim:set ts=2 sw=2 et:
