# Maintainer: Christopher Reimer <c[dot]reimer[at]googlemail[dot]com>
# Contributor: M0Rf30
# Contributor: unifiedlinux

pkgname=cinnamon
pkgver=1.6.7
pkgrel=1
pkgdesc="Linux desktop which provides advanced innovative features and a traditional user experience"
arch=('i686' 'x86_64')
url="http://cinnamon.linuxmint.com/"
license=('GPL2')
depends=('accountsservice' 'caribou' 'gconf' 'gjs' 'gnome-bluetooth' 'gnome-desktop' 'gnome-menus'
         'gnome-screensaver' 'gnome-session' 'gnome-settings-daemon' 'gnome-themes-standard' 'gstreamer0.10'
         'libcroco' 'libgnome-keyring' 'libpulse' 'muffin' 'networkmanager' 'python2')

#depends=('gjs' 'gnome-control-center' 'gnome-panel'
#         'libgnomekbd'
#         'notification-daemon' 'python2-gconf' 'python2-imaging' 'python2-lxml' 'python2-dbus')
makedepends=('gnome-common' 'intltool')
optdepends=('nemo: Official Cinnamon file manager (a Nautilus fork)')
options=('!libtool' '!emptydirs')
install=${pkgname}.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/linuxmint/$pkgname/tarball/$pkgver"
        "${pkgname}-screensaver.desktop"
        "${pkgname}2d-screensaver.desktop")
md5sums=('ea73c6367d43d82c61f977477bf0c08c'
         'd55c079cdc8bec606f510f87b2a6f776'
         '5c6af851ab1cf7e9219f11d86353196a')

build() {
  cd ${srcdir}/linuxmint-Cinnamon-*

  AUTOMAKE=automake \
  ACLOCAL=aclocal \
  ./autogen.sh --prefix=/usr \
               --sysconfdir=/etc \
               --libexecdir=/usr/lib/${pkgname} \
               --localstatedir=/var \
               --disable-static \
               --disable-schemas-compile \
               --enable-compile-warnings=yes
  make
}

package() {
  cd ${srcdir}/linuxmint-Cinnamon-*
  make DESTDIR="${pkgdir}" install

  #Run python2 instead of python(3)
  sed -i 's/bin\/python/bin\/python2/g' \
    "${pkgdir}/usr/bin/$pkgname-extension-tool" \
    "${pkgdir}/usr/bin/$pkgname-launcher" \
    "${pkgdir}/usr/bin/$pkgname-menu-editor" \
    "${pkgdir}/usr/bin/$pkgname-settings" \
    "${pkgdir}/usr/share/$pkgname/applets/panel-launchers@$pkgname.org/$pkgname-add-panel-launcher.py"

  sed -i 's/env python/env python2/g' \
    "${pkgdir}/usr/lib/$pkgname-settings/$pkgname-settings.py"

  install -Dm644 $srcdir/${pkgname}-screensaver.desktop ${pkgdir}/etc/xdg/autostart/${pkgname}-screensaver.desktop
  install -Dm644 $srcdir/${pkgname}2d-screensaver.desktop ${pkgdir}/etc/xdg/autostart/${pkgname}2d-screensaver.desktop
}


