# Maintainer: abf <zouxiaoming@gmail.com>

pkgname=vimpulse
pkgver=0.5
pkgrel=1
pkgdesc="A plugin for emacs which extends Viper with Vim features like Visual mode and text objects."
arch=('any')
license=('GPLv2')
url=http://gitorious.org/vimpulse
install=$pkgname.install
depends=()
optdepends=('emacs')
makedepends=('git')

_gitroot=git://gitorious.org/vimpulse/vimpulse.git
_gitname=vimpulse

package() {
  cd "$srcdir"
  msg "Connecting to gitorious.org"
  if [ -d "$startdir/src/$_gitname" ] ;then
	  cd "$_gitname" && git pull origin
	  msg "The local files are updated."
  else
	  git clone "$_gitroot"
  fi
  msg "GIT checkout done or server timeout"
  cd "$srcdir/$_gitname"
  git checkout master
  mkdir -p $pkgdir/usr/share/emacs/site-lisp/
  make big
  cp -rp bigd/vimpulse.el $pkgdir/usr/share/emacs/site-lisp
}

# vim:set ts=2 sw=2 et:
