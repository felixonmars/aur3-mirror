# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: <ivo@arch>
_pkgname=emacs-web-mode
pkgname=$_pkgname-git
pkgver=20130607.186
pkgrel=1
pkgdesc="is an emacs major mode for editing html templates"
arch=('i686' 'x86_64')
url="https://github.com/fxbois/web-mode.git"
license=('GPL')
groups=()
depends=('emacs')
makedepends=('git')
install=web-mode.install
changelog=
source=("$_pkgname::git+git://github.com/fxbois/web-mode.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
} 

build() {
  cd "$_pkgname"
  emacs --batch -f batch-byte-compile *.el
}

package() {
  cd "$_pkgname"
  install -d ${pkgdir}/usr/share/emacs/site-lisp/web-mode
  cp *.el *.elc ${pkgdir}/usr/share/emacs/site-lisp/web-mode
}

# vim:set ts=2 sw=2 et:
