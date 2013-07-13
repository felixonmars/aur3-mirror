# Maintainer: Marco Gulino <marco.gulino@gmail.com> 

pkgname=touche
pkgver=0.3
pkgrel=4
pkgdesc="Touché is a KDE application that brings full support on GNU/Linux desktops to your input devices: keyboard, mices, even IR remote receivers"
arch=('i686' 'x86_64')
url="http://rockman81.blogspot.it/p/touche.html"
license=('GPL')
groups=()
depends=('qt4' 'kdelibs' 'qjson')
makedepends=()
optdepends=('cwiid-git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
#source=( http://rockman81.github.com/Touche/files/Touch%C3%A9-$pkgver.tar.gz )
commit_version="34ca4b13b8d0ff27b52c3d63af67952811f5b788"
source="touche.tar.gz::https://codeload.github.com/GuLinux/Touche/tar.gz/${commit_version}"
noextract=()

build() {
  mv "${srcdir}/"*-${commit_version} "${srcdir}/touche"
  cd "${srcdir}/touche"
  mkdir build -p
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=release -DQT_QMAKE_EXECUTABLE=qmake-qt4 ..
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

md5sums=('c0c53211608d00646428facbe27a498a')
