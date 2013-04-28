# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=noblenote-git
pkgver=476.59e48df
pkgrel=1
pkgdesc="nobleNote aims to be a lightweight, open source alternative to Evernote and OneNote."
url="http://qt-apps.org/content/show.php/nobleNote?content=157713"
arch=('i686' 'x86_64')
license=('BSD')
depends=('qt4')
makedepends=('git')
source=('git+https://github.com/hakaishi/nobleNote.git')
md5sums=('SKIP')

build() {
   cd $srcdir/nobleNote

   qmake-qt4
   make
}

package() {
   cd $srcdir/nobleNote

   make INSTALL_ROOT=$pkgdir install

   # Desktop icon
   install -Dm644 noblenote.desktop $pkgdir/usr/share/applications/noblenote.desktop
   sed -i 's|Icon=noblenote|Icon=/usr/share/pixmaps/noblenote-icons/noblenote|' $pkgdir/usr/share/applications/noblenote.desktop
}

pkgver() {
  cd $srcdir/nobleNote

  echo $(git rev-list --count master).$(git rev-parse --short master)
}