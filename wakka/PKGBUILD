# Maintainer: Mitchell Nemitz <mitchell.nemitz@gmail.com>
# Contributors: EnvoyRising

pkgname=wakka
pkgver=0.4.5
pkgrel=1
pkgdesc="Package manager for Arch Linux loosely based on GtkPacman"
arch=('any')
url="http://code.google.com/p/wakka-package-manager/"
license=('GPL')
depends=('python2' 'pygtk' 'vte' 'xdg-su' 'librsvg')
source=("http://wakka-package-manager.googlecode.com/files/${pkgname}-${pkgver}.tar.bz2")
sha1sums=('46b5461dec67bc040fcf11457a85ed0ee8c866ca')

build () {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Nothing to do here
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    # Make the directories
    mkdir --parents "${pkgdir}/usr/lib/wakka/"
    mkdir --parents "${pkgdir}/usr/bin/"

    # Copy the core data files
    cp --parents -R "wakkacore/" "${pkgdir}/usr/lib/wakka/"
    cp --parents -R "data/"      "${pkgdir}/usr/lib/wakka/"

    # Copy license and readme information
    cp "COPYING" "${pkgdir}/usr/lib/wakka/"
    cp "LICENSE" "${pkgdir}/usr/lib/wakka/"
    cp "README"  "${pkgdir}/usr/lib/wakka/"

    # Copy the executables
    cp "wakka-package-manager" "${pkgdir}/usr/lib/wakka/"
    cp "wakka"                 "${pkgdir}/usr/bin/"
    
    chmod +x "${pkgdir}/usr/bin/wakka"
    
    # Add the menu entry
    mkdir --parents "${pkgdir}/usr/share/applications/"
    cp "data/wakka.desktop" "${pkgdir}/usr/share/applications/"
}
