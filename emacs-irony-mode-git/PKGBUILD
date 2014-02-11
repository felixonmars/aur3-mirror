# Maintainer: i_magnific0 (i_magnific0@yahoo.com)

pkgname=emacs-irony-mode-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Clang based package for C & C++ completion, on-the-fly syntax checking and more"
arch=('i686' 'x86_64')
url="https://github.com/Sarcasm/irony-mode"
license=('GPLv3')
depends=('pacman' 'clang')
makedepends=('git')
optdepends=('emacs-yasnippet-git'
	    'emacs-auto-complete-git')
conflicts=('emacs-irony-mode')
provides=('emacs-irony-mode')
_gitname=irony-mode
source=("$_gitname"::'git://github.com/Sarcasm/irony-mode.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  git submodule update --init
  mkdir -p build	
  cd build
  cmake .. && make -j 4
}

package() {
  cd "$srcdir/$_gitname/build"
  make install
  cd "$srcdir/$_gitname/elisp"
  install -d ${pkgdir}/usr/share/emacs/site-lisp/irony
  cp -R * ${pkgdir}/usr/share/emacs/site-lisp/irony/
  cp "$srcdir/$_gitname/bin/irony-server" ${pkgdir}/usr/share/emacs/site-lisp/irony/
  echo ">>> Add this to your configuration"
  echo "    (setq irony-server-executable "/usr/share/emacs/site-lisp/irony/irony-server")"
}