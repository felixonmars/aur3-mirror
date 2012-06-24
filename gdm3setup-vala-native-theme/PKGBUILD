# Maintainer: Nano77 <nanoarch77@gmail.com>
# Last update: 25/01/12


pkgname=gdm3setup-vala-native-theme
pkgver=20120624
pkgrel=1
pkgdesc="A GUI to setting GDM3"
arch=('i686' 'x86_64')
license=('GPL')
source=('gdm3setup-vala-native-theme.patch')
url="http://github.com/Nano77/gdm3setup"
depends=('gdm>=3' 'gnome-shell-native-theme')
makedepends=('git' 'vala')
conflicts=('gdm3setup' 'gdm3setup-native-theme' 'gdm3setup-vala')
provides=('gdm3setup' 'gdm3setup-native-theme')
sha256sums=('95bc10ed0abccfde20b6454dfe8df73b88e8919cf5f31b02619d4ce78e060bd1')

_gitroot="git://github.com/Nano77/gdm3setup-vala.git"
_gitname="gdm3setup-vala"

build() {
  cd ${srcdir}

  msg "Connecting to GIT server..."
  if [[ -d ${_gitname} ]]; then
    (cd ${_gitname} && git pull origin)
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg "GIT checkout done or server timeout"

  rm -rf ${_gitname}-build
  git clone ${_gitname} ${_gitname}-build

  cd ${srcdir}/${_gitname}-build
  patch -Np1 -i ${srcdir}/gdm3setup-vala-native-theme.patch

  cd ${srcdir}/${_gitname}-build/
  valac --pkg gio-2.0 'gdm3setup-daemon.vala'  --disable-warnings
  valac --pkg gtk+-3.0 --pkg gio-2.0 --pkg gnome-desktop-3.0 --pkg gdk-3.0 -X -D'GNOME_DESKTOP_USE_UNSTABLE_API' -X -D'GETTEXT_PACKAGE="gdm3setup"' gdm3setup.vala --disable-warnings --vapidir=./vapi

  cd ${srcdir}/${_gitname}-build/po
  ${srcdir}/${_gitname}-build/po/make-mo

}

package() {
  cd ${srcdir}/${_gitname}-build/

  install --mode=755 -D ${srcdir}/${_gitname}-build/gdm3setup ${pkgdir}/usr/bin/gdm3setup
  install --mode=755 -D ${srcdir}/${_gitname}-build/gdm3setup-daemon ${pkgdir}/usr/bin/gdm3setup-daemon
  install --mode=755 -D ${srcdir}/${_gitname}-build/gdmlogin.py ${pkgdir}/usr/bin/gdmlogin.py
  install --mode=755 -D ${srcdir}/${_gitname}-build/get_gdm.sh ${pkgdir}/usr/bin/get_gdm.sh
  install --mode=755 -D ${srcdir}/${_gitname}-build/set_gdm.sh ${pkgdir}/usr/bin/set_gdm.sh
  install -D ${srcdir}/${_gitname}-build/gdm3setup.desktop ${pkgdir}/usr/share/applications/gdm3setup.desktop
  install -D ${srcdir}/${_gitname}-build/apps.nano77.gdm3setup.service ${pkgdir}/usr/share/dbus-1/system-services/apps.nano77.gdm3setup.service
  install -D ${srcdir}/${_gitname}-build/apps.nano77.gdm3setup.service ${pkgdir}/usr/share/dbus-1/services/apps.nano77.gdm3setup.service
  install -D ${srcdir}/${_gitname}-build/apps.nano77.gdm3setup.conf ${pkgdir}/etc/dbus-1/system.d/apps.nano77.gdm3setup.conf
  install -D ${srcdir}/${_gitname}-build/apps.nano77.gdm3setup.policy ${pkgdir}/usr/share/polkit-1/actions/apps.nano77.gdm3setup.policy
  install -D ${srcdir}/${_gitname}-build/gdm3setup.ui ${pkgdir}/usr/share/gdm3setup/ui/gdm3setup.ui
  cp -r ${srcdir}/${_gitname}-build/locale/ ${pkgdir}/usr/share/locale/
}
