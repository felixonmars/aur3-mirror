# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Piotr Gorski <sir_lucjan@openlinux.pl>


pkgname=mate-text-editor-1.7
_pkgname=pluma
pkgver=1.7.1
pkgrel=1
pkgdesc="A powerful text editor for MATE"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('caja' 'desktop-file-utils' 'enchant' 'gtk2' 'gtksourceview2'
         'iso-codes' 'libsm' 'mate-desktop' 'python2' 'python2-gobject2'
         'pygtksourceview2')
makedepends=('mate-common' 'perl-xml-parser' 'yelp-tools')
optdepends=('yelp: for reading MATE help documents')
replaces=('mate-text-editor')
provides=('mate-text-editor')
conflicts=('mate-text-editor')
options=('!emptydirs')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/1.7/${_pkgname}-${pkgver}.tar.xz")
sha1sums=('aecfe49758056d5fd09356f0741fa6ce4ae26869')
install=${_pkgname}.install

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    PYTHON=/usr/bin/python2 ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib \
        --with-gtk=2.0 \
        --enable-python
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

