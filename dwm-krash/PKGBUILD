
# Tsekhovoy Eugene aka Krash <8552246@gmail.com>

pkgname='dwm-krash'
pkgver=5.9
pkgrel=2
pkgdesc="A dynamic window manager for X with patches of krash"
url="http://dwm.suckless.org"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libx11' 'dmenu' 'rxvt-unicode')
conflicts=('dwm' 'dwm-hg')
provides=('dwm')
source=("http://dl.suckless.org/dwm/dwm-${pkgver}.tar.gz"
        'config.h'
        'dwm-5.8.2-offset_monitor.patch')
md5sums=('2799f885c05817ca112d521bb247f797'
         '1cda439a951020b795495df33a0e0d06'
         'dfa8d0f8467af8ccb4983049ff0c6722')

build() {
    cd ${srcdir}/dwm-${pkgver}
    cp ${srcdir}/config.h config.h

    msg "Applying offset monitor patch..."
    patch -Np1 -i ${srcdir}/dwm-5.8.2-offset_monitor.patch || return 1

    INCS="-I. -I/usr/include -I/usr/include/X11"
    LIBS="-L/usr/lib -lc -L/usr/lib/X11 -lX11"
    CFLAGS="${CFLAGS} ${INCS} -std=c99 -pedantic -DVERSION=\\\"${pkgver}-krash\\\""
    LDFLAGS="${LDFLAGS} ${LIBS}"

    make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" || return 1
    make PREFIX=/usr DESTDIR=$pkgdir install     || return 1

    install -m644 -D LICENSE $pkgdir/usr/share/licenses/dwm/LICENSE && \
    install -m644 -D README  $pkgdir/usr/share/doc/dwm/README
}
