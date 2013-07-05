# Maintainer: Andy Ross <spiffyspaceman88@yahoo.com>
pkgname=detourious-git
pkgver=20130705
pkgrel=1
pkgdesc="Detourious theme for E17 (with support for GTK2/GTK3)"
arch=('any')
url="http://git.enlightenment.org/themes/detourious.git/"
license=('GPL')
depends=('edje')
makedepends=('subversion')

_gitroot="http://git.enlightenment.org/themes/detourious.git"
_gitname="detourious"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server..."

  if [ -d ${srcdir}/$_gitname ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
 
  if [ -d ${srcdir}/$_gitname-build ]; then
    rm -rf ${srcdir}/$_gitname-build
  fi

  git clone ${srcdir}/$_gitname ${srcdir}/$_gitname-build || return 1
  cd ${srcdir}/$_gitname-build || return 1
  make
}

package() {
  cd $srcdir/$_gitname-build
  install -Dm644 $_gitname.edj $pkgdir/usr/share/enlightenment/data/themes/$_gitname.edj
  install -Dm644 $_gitname-dark.edj $pkgdir/usr/share/enlightenment/data/themes/$_gitname-dark.edj
  install -Dm644 $_gitname-illume.edj $pkgdir/usr/share/enlightenment/data/themes/$_gitname-illume.edj
  install -Dm644 $_gitname-elm.edj $pkgdir/usr/share/elementary/themes/$_gitname-elm.edj
  mkdir -p $pkgdir/usr/share/themes/Detourious
  mv $srcdir/$_gitname-build/gtk/detourious/gtk-2.0 $pkgdir/usr/share/themes/Detourious/gtk-2.0
  mv $srcdir/$_gitname-build/gtk/detourious/gtk-3.0 $pkgdir/usr/share/themes/Detourious/gtk-3.0
}