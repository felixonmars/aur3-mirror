# Contributor: Laurie Clark-Michalek <bluepepper@archlinux.us>
# Maintiainer: swanson <webaake@gmail.com>

pkgname=brasero-3.4.1-lite
pkgver=3.4.1
pkgrel=1
pkgdesc="A disc burning application, without the totem-plparser and nautilus dependency. Suitable for non-Gnome environments."
arch=('i686' 'x86_64')
url="http://www.gnome.org/projects/brasero"
license=('GPL')
depends=('gconf' 'gstreamer0.10-base' 'dvd+rw-tools' 'cdrdao' 'cdrkit' 'libunique' 'libcanberra')
optdepends=('libburn: alternative back-end'
            'libisofs: alternative back-end'
            'dvdauthor: video project'
            'gst-plugin-bad: video project'
            'vcdimager: video project')
makedepends=('intltool' 'gnome-doc-utils')
install=brasero-3.4.1-lite.install
source=(ftp://ftp.gnome.org/pub/gnome/sources/brasero/3.4/brasero-${pkgver}.tar.xz)
options=('!emptydirs')
conflicts=('brasero' 'brasero-svn')
provides=("brasero=${pkgver}")
sha256sums=('e4fcd5dca1c7b0a930a43ae59953fa96db3f6beef41ceedb2f0ef8636e26a7a6')
build() {
  cd ${srcdir}/brasero-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --disable-maintainer-mode  --disable-schemas-compile\
	--disable-scrollkeeper --disable-gtk-doc-html --disable-nautilus --disable-inotify
  make
  make DESTDIR=${pkgdir} install
  
  mkdir -p ${pkgdir}/usr/share/gconf/schemas
  gconf-merge-schema ${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas \
    ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas

}

