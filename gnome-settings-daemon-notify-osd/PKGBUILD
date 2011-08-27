# Mantainer: Gianfranco Micoli <gianfrix.mg@gmail.com>

pkgname=gnome-settings-daemon-notify-osd
realname=gnome-settings-daemon
pkgver=2.32.0
pkgrel=1
pkgdesc="The GNOME Settings daemon. With Ubuntu 10.10 Maverick patches"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libgnomekbd>=2.31.92' 'gnome-desktop>=2.32.0' 'libnotify>=0.4.5' 'gstreamer0.10-base>=0.10.30' 'hicolor-icon-theme')
provides=('gnome-settings-daemon=2.32.0')
conflicts=('gnome-settings-daemon')
makedepends=('intltool' 'pkg-config')
options=(!emptydirs !libtool)
install=gnome-settings-daemon.install
url="http://www.gnome.org"
groups=('gnome')
source=(http://ftp.gnome.org/pub/gnome/sources/${realname}/2.32/${realname}-${pkgver}.tar.bz2
06_use_application_indicator.patch
16_use_synchronous_notifications.patch
button-swapping.patch)
sha256sums=('d5eb0270028f072e8d36c61e4677d55844669d9ab09d525f6c76b4980ec81c9e'
            'cf36132ed83b032b08c350b1a5dd48a939965075db3879ca958417967da65c8d'
            '2ae2c725ebdfe6e97e1450528c86158bea16905cc110f247d6406a94a397c4a9'
            '89128afee6ee58a7dcbb76399295bac212b90445146a115e976d4ae6c00aaac8')

build() {
  cd "${srcdir}/${realname}-${pkgver}"
  
  msg2 "Do you want to apply Ubuntu's Indicator Patch? (y/N)"
  msg2 "You'll need libdbusmenu, libindicate, libindicator, indicator-messages, indicator-session and indicator-applet installed (preferabily -bzr) for them to work!"
  read answer
  
  if [[ "$answer" = "y" ]]; then
     msg "Patching with 06_use_application_indicator.patch"
     patch -Np1 -i ../06_use_application_indicator.patch
  fi
  msg "Patching with 16_use_synchronous_notifications.patch"
  patch -Np1 -i ../16_use_synchronous_notifications.patch
  
  msg2 "Do you want to apply Button Swapping patch for Elantech/Synaptics (y/N)? (Requested by DIDI2002 on gnome-settings-daemon-notify-osd aurpage)"
  read answer
  if [[ "$answer" = "y" ]]; then  
     msg "Patching with button-swapping.patch"
     patch -Np1 -i ../button-swapping.patch
  fi
  
  libtoolize --force
  aclocal
  autoconf
  automake
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/bin --disable-static
  make
  make DESTDIR="${pkgdir}" GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 install

  install -d -m755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${realname}.schemas" --domain gnome-settings-daemon ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
