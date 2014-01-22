# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Piotr Gorski <sir_lucjan@openlinux.pl>

pkgname=mate-file-archiver-1.7
_pkgname=engrampa
pkgver=1.7.0
pkgrel=1
pkgdesc="Archive manipulator for MATE"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bzip2' 'caja' 'desktop-file-utils' 'gtk2' 'gzip' 'libarchive' 'tar')
makedepends=('mate-common' 'perl-xml-parser' 'yelp-tools')
optdepends=('unrar: for RAR uncompression'
'zip: for ZIP archives' 'unzip: for ZIP archives'
'p7zip: 7zip compression utility' 'arj: for ARJ archives'
'unace: extraction tool for the proprietary ace archive format'
'yelp: for reading MATE help documents')
replaces=('mate-file-archiver')
provides=('mate-file-archiver')
conflicts=('mate-file-archiver')
options=( '!emptydirs')
groups=('mate-extra')
source=("${_pkgname}::git+https://github.com/mate-desktop/${_pkgname}.git"
        fr-rpm-bsdtar.patch)
sha1sums=('SKIP'
          '8dfe4e37fff803573fd5aa965025d9c698363665')
install=${_pkgname}.install

prepare() {
    cd "${srcdir}/${_pkgname}"
    # This patch 'depends' on libarchive
    patch -Np1 -i "${srcdir}/fr-rpm-bsdtar.patch"
}

build() {
    cd "${srcdir}/${_pkgname}"
    ./autogen.sh \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgname} \
        --with-gtk=2.0 \
        --disable-static \
        --disable-scrollkeeper \
        --disable-packagekit
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}