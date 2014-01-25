# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Piotr Gorski <sir_lucjan@openlinux.pl>

pkgname=mate-document-viewer-1.7
_pkgname=atril
pkgver=1.7.1
pkgrel=1
pkgdesc="Simply a document viewer"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dconf' 'dbus' 'desktop-file-utils' 'gtk2' 'libsm' 'libspectre'
         'mate-icon-theme' 'poppler-glib' 'zlib')
makedepends=('caja' 'djvulibre' 'gobject-introspection' 'libgxps' 'mate-common'
             'perl-xml-parser' 'texlive-bin' 'yelp-tools')
optdepends=('caja: Document Properties extension'
            'djvulibre: DjVu support'
            'libgxps: XPS support'
            'p7zip: cbz and cb7 compressed comic books'
            'texlive-bin: DVI support'
            'unrar: cbr compressed comic books'
            'yelp: for reading MATE help documents')
replaces=('mate-document-viewer')
provides=('mate-document-viewer')
conflicts=('mate-document-viewer')
options=('!emptydirs')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/1.7/${_pkgname}-${pkgver}.tar.xz"
        "https://github.com/mate-desktop/atril/commit/a91f08748537eab497b0b2350a66e5d65fcb9a36.diff"
        "https://github.com/mate-desktop/atril/commit/b6c5615c2ac8124dadd5cc968cb0669028c18222.diff")



sha1sums=('21425f174157dd5cb7f3e803fd047069f5dc5639'
          '60fe0e4cf6b1e321ca0b4e72a45151d40d154be4'
          'b57bddd9440afd823e922f279c25c7595d2cc418')
install=${_pkgname}.install

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/a91f08748537eab497b0b2350a66e5d65fcb9a36.diff"
    patch -Np1 -i "${srcdir}/b6c5615c2ac8124dadd5cc968cb0669028c18222.diff"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgname} \
        --with-gtk=2.0 \
        --enable-gtk-doc \
        --enable-djvu \
        --enable-dvi \
        --enable-t1lib \
        --enable-pixbuf \
        --enable-comics \
        --enable-introspection \
        --disable-static
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}