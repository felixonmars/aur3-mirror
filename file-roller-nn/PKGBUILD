# Maintainer: Roland Singer <roland[at]manjarolinux[dot]org>

pkgname=file-roller-nn
pkgver=3.2.0
pkgrel=1
provides=('file-roller=3.2.0')
conflicts=('file-roller' 'nautilus')
pkgdesc="Archive manipulator for GNOME without nautilus dependency. (no nautilus)"
arch=('i686' 'x86_64')
license=('GPL')
depends=('desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'dconf')
makedepends=('intltool' 'gnome-doc-utils' 'pkg-config' 'libsm')
optdepends=('unrar: the RAR uncompression program'
            'zip: creates PKZIP-compatible .zip files'
            'unzip: unpacks .zip archives'
            'p7zip: 7zip compression utility'
            'xz: managing LZMA and XZ compressed files'
            'arj: ARJ archiver'
            'unace: extraction tool for the proprietary ace archive format')
options=('!libtool' '!emptydirs')
install=file-roller.install
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/file-roller/${pkgver%.*}/file-roller-${pkgver}.tar.bz2
        http://git.gnome.org/browse/nautilus/plain/libnautilus-private/org.gnome.nautilus.gschema.xml.in)


build() {
  cd "${srcdir}/file-roller-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/file-roller \
      --localstatedir=/var --disable-static \
      --disable-scrollkeeper --disable-schemas-compile \
      --disable-nautilus-actions
      # Configure file-roller without nautilus-actions
  make
}

package() {
    cd "${srcdir}/file-roller-${pkgver}"
    make DESTDIR="${pkgdir}" install

    # Hack to run file-roller without nautilus
    sed -i 's/_summary/summary/g;s/_description/description/g;' ${srcdir}/org.gnome.nautilus.gschema.xml.in
    install -Dm755 ${srcdir}/org.gnome.nautilus.gschema.xml.in ${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.nautilus.gschema.xml
}


md5sums=('09f7adc3df6eddf66055f5b493ec766a'
         '6feef53e9782d21b9f63472d36490ea7')
