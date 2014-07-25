# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=emacs-ac-slime-git
pkgver=20111226
pkgrel=1
pkgdesc="Slime completion source for Emacs auto-complete package"
arch=(any)
url="https://github.com/purcell/ac-slime"
license=('GPL')
groups=()
depends=('emacs' 'emacs-auto-complete')
makedepends=('git')
provides=('emacs-ac-slime')
conflicts=()
replaces=()
backup=()
options=()
install=emacs-ac-slime.install
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=git://github.com/purcell/ac-slime.git
_gitname=ac-slime

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  emacs --batch -f batch-byte-compile *.el
}

package() {
  cd "$srcdir/$_gitname-build"
  install -d ${pkgdir}/usr/share/emacs/site-lisp/ac-slime
  cp *.el *.elc ${pkgdir}/usr/share/emacs/site-lisp/ac-slime

}

# vim:set ts=2 sw=2 et:
