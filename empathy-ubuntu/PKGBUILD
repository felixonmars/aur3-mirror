# Maintainer: Gianfranco 'Gianfrix' Micoli <gianfrix.mg@gmail.com>

pkgname=empathy-ubuntu
realname=empathy
pkgver=2.32.0.1
pkgrel=1
pkgdesc="A GNOME instant messaging client using the Telepathy framework."
arch=('i686' 'x86_64')
url="http://live.gnome.org/Empathy"
license=('GPL2')
depends=('telepathy-glib>=0.12.0' 'telepathy-mission-control>=5.6.0' 'folks>=0.2.0' 'telepathy-logger>=0.1.5' 'telepathy-farsight>=0.0.15'
         'gnome-keyring>=2.32.0' 'gnutls' 'gconf>=2.32.0' 'evolution-data-server>=2.31.92' 'libcanberra>=0.25' 'libnotify' 'libunique'
         'enchant' 'iso-codes' 'libwebkit' 'dconf>=0.5.1')
makedepends=('pkg-config' 'intltool' 'gnome-doc-utils>=0.20.1' 'nautilus-sendto')
optdepends=('telepathy-gabble: XMPP/Jabber support'
            'telepathy-butterfly: MSN support'
            'telepathy-idle: IRC support'
            'telepathy-salut: Link-local XMPP support'
            'telepathy-sofiasip: SIP support'
            'telepathy-haze: libpurple support')
options=('!libtool')
groups=('gnome-extra')
provides=('empathy=2.32.0.1')
conflicts=('empathy')
install=empathy.install
source=(http://ftp.gnome.org/pub/GNOME/sources/${realname}/2.32/${realname}-${pkgver}.tar.bz2
http://archive.ubuntu.com/ubuntu/pool/main/e/empathy/empathy_2.32.0-0ubuntu2.debian.tar.bz2)
sha256sums=('df92bfb65a5eec73488ad95180c6ce6baf979292df197bcbb20de79f54a5c90c'
            'c9f8bf24381b2192b707758c5d2d2b19dabfee650f7a35787f72525d214865a5')

build() {
  cd "${srcdir}/${realname}-${pkgver}"
patch -Np1 -i ../debian/patches/02_notifications_focus.patch
patch -Np1 -i ../debian/patches/10_use_notify_osd_icons.patch
patch -Np1 -i ../debian/patches/11_empathy_accounts_category.patch
patch -Np1 -i ../debian/patches/20_libindicate.patch
patch -Np1 -i ../debian/patches/21_login_indicators.patch
patch -Np1 -i ../debian/patches/31_really_raise_window.patch
patch -Np1 -i ../debian/patches/34_start_raised_execpt_in_session.patch
patch -Np1 -i ../debian/patches/36_chat_window_default_size.patch
sed -i -e "s/python/python2/" tools/*.py
  ./autogen.sh --prefix=/usr \
      --sysconfdir=/etc  \
      --libexecdir=/usr/lib/empathy \
      --disable-schemas-compile
  make
  make DESTDIR="${pkgdir}" install
  install -d ${pkgdir}/usr/share/indicators/messages/applications/
  cp -vr ../debian/indicators/empathy ${pkgdir}/usr/share/indicators/messages/applications/
}
