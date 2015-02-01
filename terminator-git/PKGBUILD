# Maintainer: Mohammad Zolfaghari <zidom72@gmail.com>

pkgname=terminator-git
pkgver=0.97
pkgrel=2
pkgdesc='Terminal emulator that supports tabs and grids'
arch=('any')
url='http://gnometerminator.blogspot.fr/p/introduction.html'
license=('GPL2')

depends=('vte' 'pygtk' 'xdg-utils' 'python2-notify' 'python2-keybinder2')
makedepends=('desktop-file-utils' 'gettext' 'intltool')
conflicts=('terminator')
install=terminator.install
source=("git://github.com/zidoms/terminator")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname/-*}"

    for file in terminatorlib/{,plugins/}*.py; do
        sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' $file
        sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
    done

    python2 setup.py build
}

package() {
    cd "${srcdir}/${pkgname/-*}"

    python2 setup.py install --skip-build --root="${pkgdir}"

    rm -f "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}
