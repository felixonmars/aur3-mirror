# Contributor: Alexander Drozdov <adrozdoff@gmail.com>
pkgname=mount-tray-git
pkgver=20130720_8bb9e94
pkgrel=1
pkgdesc="Application for mounting and unmounting removable storages via system tray using udisks"
arch=(i686 x86_64)
url="http://gitorious.org/h4tr3d-utils/pages/MountTray"
license=('GPL2')
depends=('qt5-base' 'udev')
makedepends=('git' 'librsvg')
optdepends=('udisks: mounting backend' 'udisks2: mounting backend')
replaces=('mount-tray')
provides=('mount-tray')
source=("git+https://git.gitorious.org/h4tr3d-utils/mount-tray.git")

_gitname="mount-tray"

pkgver() {
    cd "$srcdir/$_gitname"
    echo "$(LANG=C date '+%Y%m%d')_$(git describe --always | sed 's/-/_/g')"
}

prepare() {
  cd "$srcdir"

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  qmake-qt5
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
