# Maintainer: Dmitry Korzhevin <dkorzhevin at lsupport dot net>

pkgname=glabels-unstable
pkgver=2.3.0
pkgrel=1
pkgdesc="Creating labels and business cards the very easy way"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://glabels.sourceforge.net/"
depends=('libgnomeui' 'libsm' 'desktop-file-utils' 'shared-mime-info')
conflicts=(glabels)
makedepends=('pkgconfig' 'perlxml' 'gnome-doc-utils' 'intltool')
options=('!libtool')
install=glabels.install
source=(http://ftp.gnome.org/pub/GNOME/sources/glabels/2.3/glabels-2.3.0.tar.bz2)
md5sums=('180a6f92161ceef5fc62f228b67f6940')

build() {
  cd "${srcdir}/glabels-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
              --disable-update-mimedb --disable-update-desktopdb  || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
