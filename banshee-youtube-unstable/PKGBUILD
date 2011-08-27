pkgname=banshee-youtube-unstable
_realname=banshee
pkgver=1.9.6
pkgrel=2
pkgdesc="Music management and playback for GNOME with Youtube extension enabled"
arch=('i686' 'x86_64')
url="http://banshee-project.org/"
license=('MIT')
depends=('sqlite3' 'ndesk-dbus-glib' 'mono-addins' 'taglib-sharp' 
         'gstreamer0.10-good-plugins' 'gstreamer0.10-base-plugins' 
         'gnome-sharp' 'libmtp' 'ipod-sharp' 'boo' 'mono-zeroconf' 
         'libxxf86vm' 'gnome-doc-utils' 'gnome-icon-theme' 'desktop-file-utils' 'webkit-sharp' 'gdata-sharp' 'libgpod')
makedepends=('pkgconfig' 'intltool')
optdepends=('gstreamer0.10-ugly-plugins: Extra media codecs'
            'gstreamer0.10-bad-plugins: Extra media codecs'
            'gstreamer0.10-ffmpeg: Extra media codecs'
            'brasero: CD burning'
            'notify-sharp-svn: Display Banshee tray icon')
options=('!libtool' '!makeflags' '!emptydirs')
provides=('banshee')
conflicts=('banshee')
install=banshee.install
source=(http://download.banshee-project.org/${_realname}/unstable/${pkgver}/${_realname}-${pkgver}.tar.bz2)

md5sums=('97b41c2110a3d0b220a9f45e45e25675')

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
  #rm $pkgdir/usr/share/applications/mimeinfo.cache
}

