# $Id: PKGBUILD 44361 2009-07-01 19:48:25Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=totem-xine
pkgver=2.26.3
pkgrel=1
provides=('totem' 'totem-plugin')
url="http://www.hadess.net/totem.php3"
pkgdesc="A GNOME2 integrated movie player based on Xine/libxine."
arch=(i686 x86_64)
license=('GPL2' 'custom')

depends=('xine-lib' 'totem-plparser>=2.26.2' 'libxxf86vm' 'libxtst' 'desktop-file-utils'
	'ffmpeg' 'gstreamer0.10-ffmpeg' 'gstreamer0.10' 'gstreamer0.10-bad' 'gstreamer0.10-base' 
	'gstreamer0.10-base-plugins' 'gstreamer0.10-ffmpeg' 'gstreamer0.10-good' 
	'gstreamer0.10-good-plugins' 'gstreamer0.10-python' 'gstreamer0.10-ugly'
	'gnome-mplayer' 'mplayer'
	'iso-codes>=3.10.1' 'libepc>=0.3.10' 'python>=2.6' 'startup-notification' 'python-gdata')

makedepends=('nautilus>=2.26.3' 'xulrunner>=1.9.1' 'pkgconfig' 'bluez>=4.30'
	'ffmpeg' 'gstreamer0.10-ffmpeg' 'gstreamer0.10' 'gstreamer0.10-bad' 'gstreamer0.10-base' 
	'gstreamer0.10-base-plugins' 'gstreamer0.10-ffmpeg' 'gstreamer0.10-good' 
	'gstreamer0.10-good-plugins' 'gstreamer0.10-python' 'gstreamer0.10-ugly' gnome-mplayer
	'mplayer'
	'lirc-utils' 'gnome-doc-utils>=0.16.0' 'gnome-control-center>=2.26.0'
	'libtracker' 'intltool' 'pygtk')

#optdepends=('gstreamer0.10-ugly-plugins: Extra media codecs'
#            'gstreamer0.10-bad-plugins: Extra media codecs'
#            'gstreamer0.10-ffmpeg: Extra media codecs')
options=('!libtool' '!emptydirs')
#conflicts=('totem')
replaces=('totem')
groups=('gnome-extra')
install=totem.install
source=(http://ftp.gnome.org/pub/gnome/sources/totem/2.26/totem-2.26.3.tar.bz2)
md5sums=('f8f7390f5d93268cd200086a1b4f765a')

build() {
  cd "${srcdir}/totem-2.26.3"
  LD_PRELOAD="" ./configure --prefix=/usr --sysconfdir=/etc \
                    --libexecdir=/usr/lib/totem \
		    --localstatedir=/var --disable-static \
		    --with-plugins="thumbnail screensaver ontop gromit media-player-keys properties skipto youtube screenshot" \
		    --enable-xine \
                    --enable-python --enable-nautilus \
                    --with-dbus --disable-scrollkeeper || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 \
       DESTDIR="${pkgdir}" install || return 1

  rm -f ${pkgdir}/usr/share/totem/vanity.*
  rm -f "${pkgdir}/usr/share/pixmaps/vanity.png"

  rm -rf "${pkgdir}/usr/lib/mozilla"

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/totem.schemas" --domain totem ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas

  install -m755 -d "${pkgdir}/usr/share/licenses/totem"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/totem/" || return 1
}
