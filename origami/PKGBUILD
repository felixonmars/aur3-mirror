# Maintainer: Christer Edwards <christer@zelut.org>
pkgname=origami
pkgver=0.7.4
pkgrel=1
pkgdesc="command-line management tool for Folding @ Home clients"
url="http://zelut.org/projects/origami/"
if [ "${CARCH}" = 'x86_64' ]; then
    depends=('lib32-glibc' 'lib32-gcc-libs')
fi
arch=('i686' 'x86_64')
license=('FreeBSD')
source=(http://zelut.org/projects/origami/origami-$pkgver.tar.gz)
md5sums=('79535f472bcc59178fbb12f7fb2ff022')

build() {

    install -d -m 755 $pkgdir/usr/share/doc/$pkgname/ || return 1
    install -d -m 755 $pkgdir/usr/bin || return 1

    install -D -m 755 $startdir/src/origami-$pkgver/origami $startdir/pkg/usr/bin || return 1
    install -D -m 644 $startdir/src/origami-$pkgver/README $startdir/pkg/usr/share/doc/$pkgname || return 1
    install -D -m 644 $startdir/src/origami-$pkgver/copyright $startdir/pkg/usr/share/doc/$pkgname || return 1
    install -D -m 644 $startdir/src/origami-$pkgver/changelog $startdir/pkg/usr/share/doc/$pkgname || return 1
}
