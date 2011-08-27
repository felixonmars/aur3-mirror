# Maintainer: Matthias Dietrich matthias.dietrich@wood-it.de
pkgname=timetracker
pkgver=0.1
pkgrel=1
pkgdesc="TimeTracker inspired by Hamster, but implemented with Qt in C++"
url="http://www.wood-it.de"
arch=('x86_64' 'i686')
license=('gplv3')
depends=('qt')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()

_gitroot="git://git.phpbp.de/timeTracker.git"

build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"

  qmake timeTracker.pro
	make -j2
}

package() {
  msg "Creating Dirs"
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/lib/timeTracker/"
  mkdir -p "${pkgdir}/usr/share/timeTracker/plugins/"
  mkdir -p "${pkgdir}/usr/share/timeTracker/lang/"
  mkdir -p "${pkgdir}/usr/share/timeTracker/sql/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/icons/gnome/32x32/apps/"

  msg "Copying files"
  cp $srcdir/$pkgname-$pkgver/build/bin/timeTracker "${pkgdir}/usr/bin/"
  mv $srcdir/$pkgname-$pkgver/build/lib/* "${pkgdir}/usr/lib/timeTracker/"
  cp $srcdir/$pkgname-$pkgver/gui/sql/* "${pkgdir}/usr/share/timeTracker/sql/"

  cp $srcdir/$pkgname-$pkgver/gui/timeTracker.desktop "${pkgdir}/usr/share/applications/"
  cp $srcdir/$pkgname-$pkgver/gui/images/TimeTracker-32.png "${pkgdir}/usr/share/icons/gnome/32x32/apps/"
}

# vim:set ts=2 sw=2 et:
