# Mantainer: HariSeldon <gianluigi85@gmail.com>
# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=mycinema-git
pkgver=20120505
pkgrel=1
pkgdesc="A simple, fast and multiplatform application to create your own movie collection retrieving movies informations and posters through different online website databases."
url="https://sites.google.com/site/mycinemaproject/home"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qt')
makedepends=('git')
install=mycinema-git.install

_gitroot=git://gitorious.org/mycinema/mycinema.git
_gitname=mycinema

build() {
  cd $srcdir

  msg "Downloading sources..."

  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull --rebase
  else
    git clone $_gitroot
  fi

  msg "Compiling..."

  cd mycinema/sources
  qmake
  make

}

package() {

  cd $srcdir
  cd mycinema/sources
  install -Dm755 mycinema $pkgdir/usr/share/mycinema/mycinema
  install -Dm644 icons/add.gif $pkgdir/usr/share/mycinema/icons/add.gif
  install -Dm644 icons/edit.gif $pkgdir/usr/share/mycinema/icons/edit.gif
  install -Dm644 icons/export.gif $pkgdir/usr/share/mycinema/icons/export.gif
  install -Dm644 icons/help.gif $pkgdir/usr/share/mycinema/icons/help.gif
  install -Dm644 icons/import.gif $pkgdir/usr/share/mycinema/icons/import.gif
  install -Dm644 icons/info.gif $pkgdir/usr/share/mycinema/icons/info.gif
  install -Dm644 icons/network.gif $pkgdir/usr/share/mycinema/icons/network.gif
  install -Dm644 icons/remove.gif $pkgdir/usr/share/mycinema/icons/remove.gif


}
