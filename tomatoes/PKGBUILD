# Contributor: Loui Chang <louipc dot ist at no spam gmail company>

pkgname=tomatoes
pkgver=1.55
pkgrel=10
pkgdesc="How many tomatoes can you smash in ten short minutes?"
url="http://tomatoes.sourceforge.net"
license=('ZLIB')
arch=('i686' 'x86_64')
depends=('sdl_image' 'sdl_mixer' 'mesa')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-linux-src-$pkgver.tar.bz2
    http://downloads.sourceforge.net/$pkgname/$pkgname-linux-1.5.tar.bz2
    0001-tomatoes-1.55-makefile-Append-to-compile-flags.patch
    0002-tomatoes-1.55-Quell-const-char-conversion-warnings.patch
    config.cfg)

md5sums=('b0fa201bfb55d1cb402c52ab7e743086'
    'a6a7ff71bb1098fd0a4098fd3d846339'
    '0f8be747f785b6245d421ff4d66bf886'
    'b7080141d1f849bfefc894b8790b6add'
    '77a32d3e47dbadf52814728fe01c402e')

build() {
    cd $srcdir/$pkgname-$pkgver
    patch -p1 < ../0001-tomatoes-1.55-makefile-Append-to-compile-flags.patch
    patch -p1 < ../0002-tomatoes-1.55-Quell-const-char-conversion-warnings.patch

    LDFLAGS="/usr/lib/libSDL-1.2.so.0"
    make \
        MPKDIR=/usr/share/tomatoes/ \
        MUSICDIR=/usr/share/tomatoes/music/ \
        CONFIGDIR=/usr/share/tomatoes/ \
        OVERRIDEDIR=./

    mkdir -p $pkgdir/usr/share/$pkgname

    cp -R $srcdir/$pkgname-1.5/* \
        $pkgdir/usr/share/$pkgname

    # Change special key to right ctrl for altgr users and others.
    cp $srcdir/config.cfg $pkgdir/usr/share/$pkgname

    mkdir -p $pkgdir/usr/bin
    install $srcdir/$pkgname-$pkgver/$pkgname \
        $pkgdir/usr/bin/$pkgname

    install -m644 $srcdir/$pkgname-$pkgver/icon.png \
        $pkgdir/usr/share/$pkgname/icon.png
}

