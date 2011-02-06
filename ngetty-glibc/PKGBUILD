# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
pkgname=ngetty-glibc
pkgver=1.1
pkgrel=1
pkgdesc="Daemon that starts login sessions on virtual console terminals, on demand"
url="http://riemann.fmi.uni-sofia.bg/ngetty/"
license=('GPL2')
arch=('i686' 'x86_64')
conflicts=('ngetty')
provides=('ngetty')
optdepends=('bash: for rc.d and setup.sh stripts')
backup=(etc/conf.d/ngetty)
source=(http://riemann.fmi.uni-sofia.bg/ngetty/ngetty-$pkgver.tar.gz
        ngetty.rcd
        ngetty.confd)

md5sums=('9248a9a41d3807669e03561102fb9af7'
         '41b7668e51feb1dc13afb6e92e1a1016'
         '7f5e423ebad0fd46f923418a4e1d38c8')
sha512sums=('1189cf00f7200e240d28af194601c7f51171568bb440fac1650e70914629aee3162b17ff80c50b9a03e0049a9550cd3108ca5833498517788e2de501b9fa028a'
            '4044ab0e1820f2e88ddc5fe91c6ad147ed1f12a0dd8946cf10fd9d7ecb5081cf1ad91210d31e8cdc3b12896ba428565b6460d1896aec4d50e8e150fa73b734fa'
            'b803ef5ab529e76e9d51dcfb9c7b26460886195fcad32b0c9392c08491e62ef22703e38ea22d36119e5db236fc72216699b8ec37fecbe1dec46fbf16719e3ee9')
build() {
    cd $srcdir/ngetty-$pkgver
    sed -i "s/^CFLAGS = .*/CFLAGS = $CFLAGS/" Makefile || return 1
    make all || return 1
    sed -i 's/-g utmp/-g root/' Makefile || return 1
    make DESTDIR=$pkgdir install install_other || return 1
    chmod 700 $pkgdir/etc/ngetty || return 1
    install -m755 -o root -g root -D $srcdir/ngetty.rcd $pkgdir/etc/rc.d/ngetty || return 1
    install -m644 -o root -g root -D $srcdir/ngetty.confd $pkgdir/etc/conf.d/ngetty || return 1
}
