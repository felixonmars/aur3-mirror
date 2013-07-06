# Maintainer: Rob McCathie <archaur at rmcc dot com dot au>

pkgname=lightdm-qt-greeter-bzr
pkgver=20130707
pkgrel=2
pkgdesc="Reference Qt greeter for LightDM"
arch=('i686' 'x86_64')
url="https://launchpad.net/lightdm-qt-greeter"
license='GPL3'
conflicts='lightdm-qt-greeter'
#provides='lightdm-qt-greeter'
depends=('qt4' 'liblightdm-qt4')
makedepends=('gnome-common' 'intltool' 'gobject-introspection' 'bzr')
optdepends=('polkit: for rebooting and shutting down from the greeter'
			'upower: for suspending and hibernating from the greeter')

_bzrtrunk=lp:lightdm-qt-greeter
_bzrmod=lightdm-qt-greeter

build() {
  cd ${srcdir}

  msg "Connecting to the server...."

  if [[ -d "$_bzrmod" ]]; then
    cd "$_bzrmod" && bzr pull "$_bzrtrunk"
    msg "The local files are updated."
  else
    bzr branch "$_bzrtrunk" "$_bzrmod"
    cd "$_bzrmod"
  fi
  
  ./autogen.sh --prefix=/usr
  make  
}

package() {
  cd "$srcdir"/"$_bzrmod"
  make DESTDIR="$pkgdir" install
}
