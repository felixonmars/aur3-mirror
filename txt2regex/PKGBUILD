# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Tony Dodd <arch@recalcitrance.net>
# Contributor: ragnarok <ragnarok@email.it>
pkgname=txt2regex
pkgver=0.8
pkgrel=4
pkgdesc="Regular Expression Wizard that converts human sentences to regexes."
url="http://txt2regex.sourceforge.net"
license="GPL"
arch=('any')
depends=('bash')
changelog=Changelog
source=("http://txt2regex.sourceforge.net/${pkgname}-${pkgver}.tgz")
sha256sums=('19a10fbcc144ab80d1998488be380e5c4b307101e2740491d9f90685a5c0fc8d')

prepare() {
    # fix screwed up Makefile
    sed -i '/TEXTDOMAINDIR=/s#$(LOCALEDIR)#/usr/share/locale#' "$srcdir/$pkgname-$pkgver/Makefile"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install

    # man page
    install -Dm 644 ${pkgname}.man "${pkgdir}/usr/share/man/man1/${pkgname}.1" 

    # documentation
    install -dm 755 "${pkgdir}/usr/share/doc/${pkgname}"
    install -m 644 \
        Changelog \
        NEWS \
        README \
        README.japanese \
        TODO \
        "${pkgdir}/usr/share/doc/${pkgname}"
}
