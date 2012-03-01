# Maintainer: XeCycle <XeCycle@Gmail.com>

pkgname=emacs-multi-web-mode-git
pkgver=20120301
pkgrel=2
pkgdesc="Multi Web Mode is a minor mode wich makes web editing in Emacs much easier."
arch=('any')
url="https://github.com/fgallina/multi-web-mode"
license=('GPL')
groups=()
depends=('emacs')
optdepends=('emacs-php-mode: support for editing PHP')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=emacs-multi-web-mode.install
source=(compile-cl-fix.patch)
md5sums=('54640e7602b49ea12a9ace595e64440f')
noextract=()

_gitroot=git://github.com/fgallina/multi-web-mode.git
_gitname=multi-web-mode

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

  patch -Np1 < ../compile-cl-fix.patch

  emacs -Q --batch -f batch-byte-compile $_gitname.el
}

package() {
  cd "$srcdir/$_gitname-build"
  install -d -m755 $pkgdir/usr/share/emacs/site-lisp/multi-web-mode
  install -m644 $_gitname.el{,c} README $pkgdir/usr/share/emacs/site-lisp/multi-web-mode
}
