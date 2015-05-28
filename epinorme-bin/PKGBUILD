# Maintainer: Martin Chaine <chaine_m@epitech.net>

pkgname=epinorme-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="An Epitech's norme checker."
arch=('any')
provides=('epinorme');
url="https://github.com/casimir/epinorme"
license=('custom')
source_i686=(https://bintray.com/artifact/download/casimir/generic/epinorme_${pkgver}_linux_386.tar.gz)
source_x86_64=(https://bintray.com/artifact/download/casimir/generic/epinorme_${pkgver}_linux_amd64.tar.gz)
sha1sums_i686=('30e69a16de0b567421dde31506ae753972558425')
sha1sums_x86_64=('840adaf3b766cf72b4e70aa15ed92a69bded8033')

package() {
    install -Dm 755 epinorme_${pkgver}_*/epinorme $pkgdir/usr/bin/epinorme
}
