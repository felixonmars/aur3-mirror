# Contributor: Alexander Drozdov <adrozdoff@gmail.com>
pkgname=mount-tray
pkgver=1.2.5
pkgrel=4
pkgdesc="Application for mounting and unmounting removable storages via system tray using udisks"
arch=(i686 x86_64)
url="http://gitorious.org/h4tr3d-utils/pages/MountTray"
license=('GPL2')
depends=('qt4>=4.5' 'udev')
makedepends=('git' 'librsvg')
optdepends=('udisks: mounting backend')
conflicts=('mount-tray-git')
source=("git+https://git.gitorious.org/h4tr3d-utils/mount-tray.git#tag=$pkgver")

_gitname="mount-tray"

prepare() {
  cd "$srcdir"

  rm -rf "$srcdir/$_gitname-build"
  cp -a "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  qmake-qt4
}

build() {
  cd "$srcdir/$_gitname-build"
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"

  install -m0755 mount-tray                "${pkgdir}/usr/bin"
  install -m0644 mount-tray.desktop        "${pkgdir}/usr/share/applications"
  rsvg-convert -d 2400 -z 3.0 -a -o images/icon.png images/icon.svgz
  install -m0644 images/icon.png "${pkgdir}/usr/share/pixmaps/mount-tray.png"
}

md5sums=('SKIP')
