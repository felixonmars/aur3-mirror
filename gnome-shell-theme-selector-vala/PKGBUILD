# Maintainer: Nano77 <nanoarch77@gmail.com>
# Last update: 11/14/12


pkgname=gnome-shell-theme-selector-vala
pkgver=20111214
pkgrel=1
pkgdesc="A GUI to set GnomeShell Theme"
arch=('i686' 'x86_64')
license=('GPL')
url="http://github.com/Nano77/gnome-shell-theme-selector"
depends=('gnome-shell-native-theme')
makedepends=('git' 'vala')
optdepends=('gdm3setup-native-theme: Select the GDM GnomeShell Theme')
conflicts=('gnome-shell-theme-selector')

_gitroot="git://github.com/Nano77/gnome-shell-theme-selector-vala.git"
_gitname="gnome-shell-theme-selector-vala"

build() {
  cd ${srcdir}

  msg "Connecting to GIT server..."
  if [[ -d ${_gitname} ]]; then
    (cd ${_gitname} && git pull origin)
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg "GIT checkout done or server timeout"

}

package() {
	cd ${srcdir}/gnome-shell-theme-selector-vala/

		valac --pkg gtk+-3.0 --pkg gio-2.0 'gnome-shell-theme-selector.vala' --disable-warnings

	install --mode=755 -D gnome-shell-theme-selector ${pkgdir}/usr/bin/gnome-shell-theme-selector
	install -D gnome-shell-theme-selector.desktop ${pkgdir}/usr/share/applications/gnome-shell-theme-selector.desktop

}
