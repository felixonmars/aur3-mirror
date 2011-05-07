pkgname=banshee-youtube
_realname=banshee
pkgver=2.0.1
pkgrel=2
pkgdesc="Music management and playback for GNOME with Youtube extension enabled"
arch=('i686' 'x86_64')
url="http://banshee-project.org/"
license=('MIT')
depends=('sqlite3' 'ndesk-dbus-glib' 'mono-addins' 'taglib-sharp' 
         'gstreamer0.10-good-plugins' 'gstreamer0.10-base-plugins' 
         'gnome-sharp' 'libmtp' 'ipod-sharp' 'libgpod' 'boo' 'mono-zeroconf' 'libxxf86vm' 'gnome-icon-theme' 'desktop-file-utils' 'webkit-sharp' 'gdata-sharp')
makedepends=('pkgconfig' 'intltool')
optdepends=('gstreamer0.10-ugly-plugins: Extra media codecs'
            'gstreamer0.10-bad-plugins: Extra media codecs'
            'gstreamer0.10-ffmpeg: Extra media codecs'
            'brasero: CD burning'
            'notify-sharp-svn: Display Banshee tray icon')
options=('!libtool' '!makeflags' '!emptydirs')
provides=('banshee=='$pkgver)
conflicts=('banshee')
install=banshee.install
source=(http://download.banshee-project.org/${_realname}/stable/${pkgver}/${_realname}-${pkgver}.tar.bz2)
md5sums=('83d77447936eed84eba2123b341b62ea')

build() {
  export MONO_SHARED_DIR="${srcdir}/.wabi"
  mkdir -p "${MONO_SHARED_DIR}"
  cd "${srcdir}/${_realname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --disable-docs \
              --disable-static || return 1
  make || return 1
}

package() {
  export MONO_SHARED_DIR="${srcdir}/.wabi"
  mkdir -p "${MONO_SHARED_DIR}"
  cd "${srcdir}/${_realname}-${pkgver}"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1

  install -m755 -d "${pkgdir}/usr/share/licenses/${_realname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${_realname}/" || return 1

  install -d -m755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_realname}.schemas" --domain banshee-1 ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}

