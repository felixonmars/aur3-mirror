# Maintainer: AlexanderR <alexander r at gmx com>
# Contributor: Michal Gawronski <dinth1906 at gmail dot com>

pkgname=tome3
pkgver=3.0.0alpha19
pkgrel=2
pkgdesc="The Tales of Middle Earth is a fantasy adventure game, based on the works of J.R.R. Tolkien. It is a game that emphasizes intricate, challenging, and varied gameplay over graphics. This is the last version in 3.x series before fully rewritten version 4."
arch=('i686' 'x86_64')
url=http://forums.te4.org/viewforum.php?f=29
# OMG, there is even this crazy mix of GPL and non-commercial cluase!
license=('custom' 'BSD' 'GPL2')
depends=('ncurses' 'libx11' 'sdl_gfx' 'sdl_mixer' 'sdl_net')
source=(http://www.zaimoni.com/zaiband/Angband.ref/ToME/tome-300alpha19-src.tar.bz2)
md5sums=('7a993d72639da0f797a9e129b0b227de')

build() {
    cd "$srcdir/tome-300alpha19-src/src"

    sed -e 's@PREFIX ?= /usr/local@PREFIX ?= /usr@;s@LIBDIR = $(PREFIX)/games/$(TOMENAME)/@LIBDIR = $(PREFIX)/share/$(TOMENAME)/@' ./makefile.std > ./Makefile
    sed -n '/Copyright/,/from the author(s)./s/*//p' main-sdl.c > LICENSE
    sed -n '/Copyright/,/copies./s/*//p' plots.c >> LICENSE
    LDFLAGS="-lm" make
}

package() {
    cd "$srcdir/tome-300alpha19-src/src"

    make DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
