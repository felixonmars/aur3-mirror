# Maintainer: Martin Wimpress <code@flexion.org>

_pkgname=orchis-gtk-theme
pkgname=${_pkgname}-git
pkgver=259.f58452b
pkgrel=2
pkgdesc="An elegant, modern desktop theme that has semi-flat style and eschewing some of the traditional design patterns, it creates an elegant desktop experience."
arch=('any')
url="https://github.com/moka-project/orchis-gtk-theme"
license=('GPL3')
depends=('gnome-themes-standard' 'gtk-engine-murrine')
makedepends=('git')
conflicts=("${_pkgname}" 'orchis-gtk-git')
provides=("${_pkgname}" 'orchis-gtk-git')
replaces=("${_pkgname}" 'orchis-gtk-git')
options=(!strip)
source=(${_pkgname}::"git+https://github.com/moka-project/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    install -d -m 755 "${pkgdir}"/usr/share/themes/{Orchis,Orchis-Dark}
    cp -dr --no-preserve=ownership "${_pkgname}"/{Orchis,Orchis-Dark} "${pkgdir}"/usr/share/themes/
    find "${pkgdir}"/usr/share/themes/ -type d -exec chmod 755 {} \;
    find "${pkgdir}"/usr/share/themes/ -type f -exec chmod 644 {} \;
}
