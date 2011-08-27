#Previous Contributor: mutlu_inek <mutlu_inek@yahoo.de>
#Contributor: Vinzenz Vietzke <vinz@archlinux.us>
#Maintainer: Vinzenz Vietzke <vinz@archlinux.us>

pkgname=beagle-no-gnome
pkgver=0.3.9
pkgrel=2
pkgdesc="The famous desktop search tool without its heavy Gnome dependencies. License is set custom, since various parts are covered by various licenses. Core parts are licensed under the MIT."
url="http://beagle-project.org"
license=('custom' 'MIT')
arch=('i686' 'x86_64')
depends=('mono' 'gtk-sharp-2' 'gmime' 'libsm' 'librsvg' \
	'libexif' 'sqlite3' 'libxss' 'wv' 'gsf-sharp' 'taglib-sharp' \
	'chmlib' 'librsvg' 'shared-mime-info' 'gnome-mime-data' \
	'gnome-vfs' 'python' 'pygtk' 'ndesk-dbus' 'ndesk-dbus-glib')
makedepends=('zip' 'pkgconfig' 'perlxml')
options=('!libtool')
conflicts=('beagle')
provides=('beagle')
backup=('etc/beagle/crawl-applications' 'etc/beagle/crawl-documentation'
        'etc/beagle/crawl-windows')
source=(http://ftp.gnome.org/pub/GNOME/sources/beagle/0.3/beagle-${pkgver}.tar.bz2)
md5sums=('b73c12423d2d67133dbb05933f4c8fe1')

build() {
  cd ${startdir}/src/beagle-${pkgver}
  export MONO_SHARED_DIR=${startdir}/src/.wabi
  mkdir -p ${MONO_SHARED_DIR}
  sed -i -e 's/CRAWL_USER=beagleindex/CRAWL_USER=beaglidx/' tools/beagle-crawl-system.in
  sed -i -e 's/libchm.so.1/libchm.so.0/' Util/ChmFile.cs
  sed -i -e 's/"column.SetCellDataFunc (renderer, NameCellFunc);"/"column.SetCellDataFunc (renderer, new TreeCellDataFunc (NameCellFunc));"/' tools/Settings.cs
 
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	--enable-inotify --disable-gui \
	--disable-evolution --enable-python --enable-gsf-sharp \
	--disable-static --disable-docs 
  make || return 1
  make DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/licenses/beagle
  install -m644 ${startdir}/src/beagle-${pkgver}/COPYING \
                ${startdir}/pkg/usr/share/licenses/beagle
}
