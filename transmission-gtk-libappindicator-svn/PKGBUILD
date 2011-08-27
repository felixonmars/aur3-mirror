# Maintainer: Michal "Dinth" Gawronski <dinth1906@gmail.com>
# Contributor: fredbezies <fredbezies@gmail.com>

pkgname=transmission-gtk-libappindicator-svn
pkgver=10899
pkgrel=1
pkgdesc="A fast, easy, and free multi-platform BitTorrent client with a focus on being lightweight yet feature-filled. GTK-UI only version"
url="http://www.transmissionbt.com/"
license="MIT"
arch=('i686' 'x86_64')
depends=('curl>=7.16.3' 'openssl>=0.9.4' 'desktop-file-utils' 'hicolor-icon-theme')
provides=('transmission', 'transmission-svn', 'transmission-svn-gtk', 'transmission-gtk')
conflicts=('transmission', 'transmission-svn', 'transmission-svn-gtk', 'transmission-gtk')
makedepends=('gtk2>=2.6.0' 'subversion' 'intltool')
backup=('etc/conf.d/transmissiond')
install=transmission.install
#source=(transmissiond
#	transmissiond.conf)
#md5sums=('2a87aa815d2702209639719a9179d6fb'
#         '7b019a710493ec4f8b54a1f528e1981d')

_svntrunk="svn://svn.m0k.org/Transmission/trunk"
_svnmod="Transmission"

build() {
cd $startdir/src
mkdir -p ~/.subversion

svn co $_svntrunk $_svnmod
msg "SVN checkout done or server timeout"

msg "Starting make..."
cd "$srcdir/$_svnmod"

msg2 "autogen.sh..."
(./autogen.sh --prefix=/usr --disable-cli --disable-daemon --enable-libnotify --enable-libappindicator) || return 1

msg2 "make"
make -s || return 1

msg2 "make install"
cd "$srcdir/$_svnmod"
make DESTDIR="$pkgdir" install || return 1

# Remove web client (seen in transmission official package)

rm -rf "$pkgdir/usr/share/transmission" || return 1

cd "$srcdir/$_svnmod"
install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING" || return 1
}
