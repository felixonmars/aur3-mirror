# Contributor: ugaciaka <ugaciaka@gmail.com>

pkgname=linux-it.mo-testing
pkgver=2.6.38
pkgrel=1
pkgdesc="Progetto Configurazione Italiana del Kernel Linux"
arch=('any')
url="http://massimo.solira.org/pcikl/index.html"
license=('GPL2')
depends=('kernel26>=2.6.38' 'kernel26<2.6.39')
source=(http://massimo.solira.org/pcikl/files/linux-${pkgver}.mo.bz2)
md5sums=('02af63d67b0da2b6269acc352d5f5591')

build() {
    cd ${srcdir}
    install -D -m644 linux-${pkgver}.mo ${pkgdir}/usr/share/locale/it/LC_MESSAGES/linux.mo
}
