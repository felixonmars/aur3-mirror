# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer: Luis Henrique Mello <lmello.009@gmail.com>

pkgname=comix
pkgver=4.0.4
pkgrel=7
pkgdesc="A comic book viewer"
arch=('i686' 'x86_64')
url="http://comix.sourceforge.net"
license=('GPL')
depends=('pygtk' 'python2-pillow' 'unrar' 'xdg-utils')
makedepends=('gettext' 'intltool')
install=comix.install
source=(http://downloads.sourceforge.net/project/comix/comix/comix-4.0.4/comix-4.0.4.tar.gz comix-pillow.patch)
md5sums=('029227a77b122f7080ee0280d41bee78' '290c34fe10c3e045b3b2f6a069239996')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    # python2 fix
    for file in src/comix.py mime/comicthumb; do
        sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
    done

    # python2-pillow fix
    patch -p1 < ${srcdir}/comix-pillow.patch

}

package() {
    cd ${srcdir}/comix-${pkgver}
    mkdir -p ${pkgdir}/usr
    python2 install.py install --no-mime --dir ${pkgdir}/usr
    install -D -m644 mime/comicbook.schemas \
        ${pkgdir}/usr/share/gconf/schemas/comix.schemas
    install -D mime/comicthumb ${pkgdir}/usr/bin/comicthumb
    install -D -m644 mime/comicthumb.1.gz \
        ${pkgdir}/usr/share/man/man1/comicthumb.1.gz
}
