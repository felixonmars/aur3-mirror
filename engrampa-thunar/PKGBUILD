# Maintainer : Rob McCathie <korrode AT gmail>
# Contributor: n00b <dannyurvt (at) gmail.com>

pkgname=engrampa-thunar
pkgver=1.10.0
pkgrel=1
pkgdesc="Archive manipulator for MATE, without caja dependency"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dconf' 'bzip2' 'desktop-file-utils' 'gtk2' 'gzip' 'libarchive' 'tar')
makedepends=('libsm' 'mate-common' 'perl-xml-parser' 'yelp-tools')
optdepends=('unrar: for RAR uncompression'
            'zip: for ZIP archives' 'unzip: for ZIP archives'
            'p7zip: 7zip compression utility' 'arj: for ARJ archives'
            'unace: extraction tool for the proprietary ace archive format'
            'yelp: for reading MATE help documents'
            'thunar-archive-plugin: create and deflate archives in thunar')
replaces=('mate-file-archiver-thunar')
provides=('mate-file-archiver-thunar')
conflicts=('mate-file-archiver' 'engrampa' 'mate-file-archiver-thunar')
options=( '!emptydirs')
source=("http://pub.mate-desktop.org/releases/1.10/${pkgname%-*}-${pkgver}.tar.xz"
        'fr-rpm-bsdtar.patch'
        'engrampa.tap')
sha1sums=('bca7140ac1715620fc2336ef6352df8a6f9d927b'
          '219b05a979bf6f249aaae27964f02345fd81168d'
          'd493b15ccf77279dfa9dbe2c05243acf26be004a')
install=engrampa.install

prepare() {
    cd "${srcdir}/${pkgname%-*}-${pkgver}"
    # This patch 'depends' on libarchive
    patch -p1 -i "${srcdir}/fr-rpm-bsdtar.patch"
}

build() {
    cd "${srcdir}/${pkgname%-*}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${pkgname%-*} \
        --with-gtk=2.0 \
        --disable-static \
        --disable-packagekit \
        --disable-caja-actions
    make
}

package() {
    cd "${srcdir}/${pkgname%-*}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -Dm755 ${srcdir}/engrampa.tap ${pkgdir}/usr/lib/xfce4/thunar-archive-plugin/engrampa.tap
}
