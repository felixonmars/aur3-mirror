# Maintainer: Daniele Iamartino <otacon22otaku@gmail.com>
pkgname=poulstatus
pkgver=20110213
pkgrel=2
pkgdesc="A POuL status icon in the tray bar. Shows if POuL is open"
arch=(any)
url="http://poul.org/"
license=('GPL')
depends=(python2 pygtk libnotify git)
_gitroot="git://github.com/Otacon22/poulstatus"
_gitname="poulstatus"

build() {
 msg "Connecting to GIT server..."
 if [[ -d $srcdir/${_gitname} ]]; then
    cd ${srcdir}/${_gitname} && git pull origin || return 1
 else
    git clone $_gitroot ${srcdir}/${_gitname} || return 1
    cd $srcdir/${_gitname}
 fi
 msg "GIT checkout done or server timeout"
}

package() {
  cd "$srcdir/$_gitname"

  install -D poul.png "$pkgdir/usr/share/pixmaps/poul.png"
  install -D poul_off.png "$pkgdir/usr/share/pixmaps/poul_off.png"
  install -m 755 -D poul.py "$pkgdir/usr/bin/poulstatus"
  install -m 744 -D poulstatus.desktop "$pkgdir/usr/share/applications/poulstatus.desktop"
}


