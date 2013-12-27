pkgname=osdlyrics-abiehaf
provides=osdlyrics
conflicts=(osdlyrics 'osdlyrics-git')
pkgver=0.4.3
pkgrel=1
pkgdesc="A lyric show compatible with various media players + ViewLyrics source"
arch=('i686' 'x86_64')
url="http://code.google.com/p/osd-lyrics/"
license=('GPL3')
depends=('gtk2' 'dbus-glib' 'curl' 'libnotify' 'libmpd' 'xmms2'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool')
install=$pkgname.install
source=("http://osd-lyrics.googlecode.com/files/$provides-$pkgver.tar.gz"
	'abiehaf.patch'
	'ol_lrc_fetch_viewlyric.c'
	'ol_lrc_fetch_viewlyric.h')
md5sums=('a14a3fbfe07eb7137074126db63b9aa2' 
	'f4220c765ff2f18c664776b45185e0dd'
	'70e8ad5ff43fbd8825e02fe3610f8880'
	'bfb89dfd8ae7ff5d8c0ae8f5d1aaa521')

prepare()
{
    cd "$srcdir/$provides-$pkgver"
    patch -p1 -i ../abiehaf.patch
    cp ../ol_lrc_fetch_viewlyric.c ./src/
    cp ../ol_lrc_fetch_viewlyric.h ./src/
    
    # Fix Issue 301
    echo "#include <inttypes.h>" >> ./src/ol_singleton.h
}

build()
{
    cd "$srcdir/$provides-$pkgver"

    ./configure --prefix=/usr
    make
}

package()
{
    cd "$srcdir/$provides-$pkgver"
    make DESTDIR="$pkgdir" install
}