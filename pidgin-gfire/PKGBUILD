# Contributor: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: LookTJ <jesus[dot]christ[dot]i[dot]love[at]gmail[dot]com>

pkgname=pidgin-gfire
pkgver=0.9.4
pkgrel=3
pkgdesc="Gfire is an Plugin for the Pidgin IM client which allows you to connect the Xfire network."
arch=('i686' 'x86_64')
url="http://gfireproject.org/"
license=('GPL')
depends=('glib2' 'libpurple' 'libnotify' 'gtk2')
makedepends=('pkgconfig' 'intltool' 'libtool')
source=("http://downloads.sourceforge.net/gfire/pidgin-gfire-$pkgver.tar.bz2" "gfire-libnotify.patch")
md5sums=('7167828fd77200603a318afdd4d9ebd2'
         '5d6fc2b98837fbebba6bef2648699d5e')

build() {
    cd "$srcdir/pidgin-gfire-$pkgver"

    patch -p0 -i ../gfire-libnotify.patch
    ./autogen.sh || return 1
    ./configure --prefix=/usr --enable-libnotify
    make || return 1
    make DESTDIR="$pkgdir" install

    rm $pkgdir/usr/lib/purple-2/libxfire.la
}
