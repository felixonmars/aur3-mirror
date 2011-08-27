# Contributor: ugaciaka <ugaciaka@gmail.com>

pkgname=linux-it.mo
pkgver=2.6.39
pkgrel=1
pkgdesc="Progetto Configurazione Italiana del Kernel Linux"
arch=('any')
url="http://massimo.solira.org/pcikl/index.html"
license=('GPL2')
depends=('kernel26>=2.6.38' 'kernel26<2.6.40')
source=(http://massimo.solira.org/pcikl/files/linux-${pkgver}.mo.bz2)

build() {
    cd ${srcdir}
    install -D -m644 linux-${pkgver}.mo ${pkgdir}/usr/share/locale/it/LC_MESSAGES/linux.mo
}
md5sums=('2b82c7136dc9587bb33b4568a4e214f9')
