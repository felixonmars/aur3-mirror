#Maintainer: Abilng<abilngeorge@gmail.com>

pkgname="gnome-baxc"
pkgver=20120922
pkgrel=1
pkgdesc="A GUI to setting dynamic wallpaper for gnome (2/3)"
arch=(any)
license=('GPLv3')
url="http://github.com/abilng/gnome-baxc"
makedepends=('git')
depends=('python>=2' 'pyqt>=4')
_gitroot="git://github.com/abilng/gnome-baxc.git"
_gitname="gnome-baxc"

install=gnome-baxc.install

build() {

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
 

}

package() {
	install --mode=755 -D ${srcdir}/${_gitname-build}/src/baxc.py  ${pkgdir}/usr/share/gnome-baxc/baxc.py
	install --mode=755 -D ${srcdir}/${_gitname-build}/src/gui.py  ${pkgdir}/usr/share/gnome-baxc/gui.py
	install --mode=755 -D ${srcdir}/${_gitname-build}/src/imagepro.py  ${pkgdir}/usr/share/gnome-baxc/imagepro.py
	install --mode=755 -D ${srcdir}/${_gitname-build}/gnome-baxc.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/gnome-baxc.svg
	install -D ${srcdir}/${_gitname-build}/src/Gnome-Baxc.desktop ${pkgdir}/usr/share/applications/Gnome-Baxc.desktop
	install --mode=755 -D ${srcdir}/${_gitname-build}/gnome-baxc  ${pkgdir}/usr/bin/gnome-baxc
}
