# Maintainer: Pierre Neidhardt <ambrevar at gmail dot com>

_name=bison-mode
pkgname=emacs-$_name
pkgver=0.1
pkgrel=2
pkgdesc="Emacs major mode for Bison"
arch=('any')
url="http://www.emacswiki.org/emacs/BisonMode"
license=('GPL')
depends=('emacs-make-regexp' 'emacs-flex-mode')
makedepends=('emacs')
install=$pkgname.install
source=(http://ftp.sunet.se/pub/gnu/emacs-lisp/incoming/bison-mode.el
    bison-ccfonts.patch)
sha1sums=('a9673e9de49e78f1df2b8d3426a85f5e887ae51e'
          '992ea64f5caa3cdf7622fc207cf12248b93f81e5')

build() {
  ## Fix 'c-font-lock-keywords' bug. The use of ${startdir} in PKGBUILD is
  ## deprecated, but I cannot find a way to patch it properly since the source
  ## is one file only and has no folder. Besides the use of --follow-symlinks
  ## option for 'patch' is also discouraged. If anyone has a clue, please let me
  ## know.
  cd  "${startdir}"
  patch -p1 -i ${srcdir}/bison-ccfonts.patch
  cd "${srcdir}"

  emacs --batch --no-site-file -f batch-byte-compile $_name.el
}

package() {
  mkdir -p $pkgdir/usr/share/emacs/site-lisp
  cp *.el{c,} $pkgdir/usr/share/emacs/site-lisp/
}
