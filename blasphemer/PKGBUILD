# Maintainer: Zohar Malamant <dotfloat gmail com>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>

pkgname=blasphemer
pkgver=0.1.5
pkgrel=1
pkgdesc="A free Heretic game data file (IWAD)"
arch=('any')
url="http://code.google.com/p/${pkgname}"
license=('BSD')
source=("https://blasphemer.googlecode.com/files/${pkgname}-${pkgver}.zip")
md5sums=('c0f5df637077df9ac6fdf43f7b4dfe1d')

build() {
    install -d ${pkgdir}/{usr,usr/share,usr/share/doom}
    install -m644 ${srcdir}/BLASPHEM.WAD ${pkgdir}/usr/share/doom/blasphem.wad
    install -D -m644 ${srcdir}/copying ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
