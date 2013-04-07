# Contributor: Bartek Piotrowski <barthalion@gmail.com>

_pkgname=ekg2
pkgname=ekg2-git
pkgver=0.5812.eb09813
pkgrel=1
epoch=1
pkgdesc="Ncurses based Jabber, Gadu-Gadu, Tlen and IRC client. Latest GIT snapshot."
arch=('i686' 'x86_64')
url="http://ekg2.org/"
license=('GPL')
depends=('aspell' 'libjpeg' 'python2' 'libgadu' 'gnutls' 'gpm' 'libidn' 'giflib')
optdepends=( 'xosd: xosd support'
	         'sqlite: sqlite support'
		 'gtk2: gtk support')
provides=('ekg2-unicode' 'ekg2')
conflicts=('ekg2' 'ekg2-unicode-svn')
source=('git://github.com/Enlik/ekg2.git')
md5sums=('SKIP')


pkgver() {
	cd $_pkgname
	echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
    cd "$srcdir/$_pkgname"

    ./autogen.sh
    sed -i 's|ncursesw/ncurses.h|ncurses.h|g' configure plugins/ncurses/ecurses.h
    export PYTHON=/usr/bin/python2 #EKG2 isn't python3 friendly
    ./configure --prefix=/usr \
                --sysconfdir=/etc \
		--libexecdir=/usr/lib/ekg2 \
                --with-libgadu \
                --with-xosd \
                --enable-unicode \
                --enable-shared \
                --without-gpg
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR=$pkgdir install

    rm -rf $pkgdir/usr/lib/perl5/core_perl/perllocal.pod
    rm -rf $pkgdir/usr/libexec
    chmod -R 755 $pkgdir/usr/lib/perl5
}
