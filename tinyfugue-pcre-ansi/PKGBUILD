# Maintainer: Maciej Szlosarczyk <arch@sosek.net>
# Old Maintainer: Blake Smith <blakesmith@gmail.com>

pkgname=tinyfugue-pcre-ansi
pkgver=5.0b8
pkgrel=1
pkgdesc="a flexible, screen-oriented MUD client, for use with any type of MUD. Patched for compatibility with PCRE-8.30+ and ANSI-colored logs with timestamps."
url="http://tinyfugue.sourceforge.net/"
depends=(pcre zlib ncurses openssl)
source=("http://downloads.sourceforge.net/sourceforge/tinyfugue/tf-50b8.tar.gz"
        "tf-50b8-log-timestamp+ansi.patch"
        "tf-50b8.pcre.patch")
license=("GPL")
arch=('i686' 'x86_64')
provides=("A PCRE-8.30+ patch and a patch for ANSI-colored logs with timestamps.")
md5sums=('3e994e791966d274f63b0e61abf2ef59'
         'd124cded77ca9225104bb76ee8ae1b0e'
         'c6fa5c160f5ee4e99af6965a0ffbab4b')

build() {
	cd $startdir/src/tf-50b8
	patch -p1 -i "${startdir}/tf-50b8-log-timestamp+ansi.patch"
    patch -p1 -i "${startdir}/tf-50b8.pcre.patch"
	mkdir $startdir/pkg/usr
	./configure --prefix=/usr --enable-termcap=ncurses
	make || return 1
	make prefix=$startdir/pkg/usr install || return 1
} 
