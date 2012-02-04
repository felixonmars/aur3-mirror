# Maintainer: Pierre Buard <pierre.buard+aur gmail com>
pkgname=pgl-nogui
pkgver=2.0.4
pkgrel=2
pkgdesc='A privacy oriented firewall application.'
url='http://phoenixlabs.org/'
arch=('i686' 'x86_64')
depends=('start-stop-daemon' 'libnfnetlink' 'libnetfilter_queue' 'iptables' 'wget')
optdepends=('dbus-core'
	    'zlib: to directly load gz compressed blocklists'
	    'p7zip: for blocklists packed as .7z'
	    'unzip: for blocklists packed as .zip'
	    'networkmanager: to run a white-listing script when detecting new network interfaces')
license=('GPL')
conflicts=('blockcontrol' 'moblock')
backup=('etc/pgl/allow.p2p'
	'etc/pgl/blocklists.list'
	'etc/pgl/pglcmd.conf')
source=(http://downloads.sourceforge.net/project/peerguardian/PeerGuardian%20Linux/$pkgver/pgl_no-GUI-$pkgver.tar.gz
	if-up)
md5sums=('2086dc9e233e7c99be5152385e14698a'
	 '0982999de0a78aff23006c7aa83f3fd9')

build() {
    # Adapt paths to Arch Linux
    sed -i 's|/sbin/start-stop-daemon|/usr/bin/start-stop-daemon|g' $srcdir/pgl-$pkgver/pglcmd/pglcmd.lib
    find $srcdir/pgl-$pkgver -type f -exec sed -i 's|/etc/init.d|/etc/rc.d|g' {} \;

    cd $srcdir/pgl-$pkgver/
    make PREFIX=/usr sysconfdir=/etc localstatedir=/var
}

package() {
    cd $srcdir/pgl-$pkgver/
    make PREFIX=/usr sysconfdir=/etc localstatedir=/var DESTDIR=$pkgdir install

    # Man
    gzip $srcdir/pgl-$pkgver/docs/pgld.1
    install -Dm644 $srcdir/pgl-$pkgver/docs/pgld.1.gz $pkgdir/usr/share/man/man1/pgld.1.gz
    ln -s /usr/share/man/man1/pgld.1.gz $pkgdir/usr/share/man/man1/pglcmd.wd.1.gz
    # Texts
    install -d $pkgdir/usr/share/doc/pgl/
    install -Dm644 $srcdir/pgl-$pkgver/docs/{AUTHORS,BUGS,README,README.blocklists,THANKS,TODO} $pkgdir/usr/share/doc/pgl/
    install -Dm644 $srcdir/pgl-$pkgver/debian/copyright $pkgdir/usr/share/licenses/pgl/LICENSE
    # Scripts
    install -Dm755 $srcdir/pgl-$pkgver/docs/iptables-custom-* $pkgdir/usr/lib/pgl/
    install -Dm755 $srcdir/if-up $pkgdir/etc/NetworkManager/dispatcher.d/pgl
    rm -r $pkgdir/etc/network/
}