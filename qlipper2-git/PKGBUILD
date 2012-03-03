# Maintainer: karabaja4 <karabaja4@gmail.com>
# Contributor: Demon

pkgname=qlipper2-git
pkgver=20120303
pkgrel=1
pkgdesc="Lightweight & cross-platform clipboard history applet based on qt"
arch=('i686' 'x86_64')
url="http://code.google.com/p/qlipper/"
license=("GPL")
depends=('qt')
provides=('qlipper')
conflicts=('qlipper')

_gitroot="git://gitorious.org/qlipper/qlipper.git"
_gitname="qlipper"

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
  cp -R "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -m 755 -d ${pkgdir}/usr/share/qlipper/translations 
  install -D -m755 qlipper ${pkgdir}/usr/bin/qlipper
  install -Dm644 qlipper.desktop ${pkgdir}/usr/share/applications/qlipper.desktop
  install -Dm644 src/icons/qlipper.png ${pkgdir}/usr/share/pixmaps/qlipper.png
  install -Dm644 ts/*.qm ${pkgdir}/usr/share/qlipper/translations
}