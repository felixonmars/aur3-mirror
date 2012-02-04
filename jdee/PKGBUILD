# PKGBUILD for JDEE 2.4.0.1
# Contributor: Brandon Ednes <brandon@as220.org>
# $Id$
pkgname=jdee
_pkgname=jde
pkgver=2.4.0.1
pkgrel=1
pkgdesc="The Java Development Environment for Emacs"
arch=('i686' 'x86_64')
url="http://jdee.sourceforge.net/"
license="GPL"
depends=('emacs' 'cedet' 'emacs-elib')
makedepends=()
conflicts=()
replaces=()
backup=()
install="$pkgname.install"
source=(http://downloads.sourceforge.net/project/jdee/jdee/2.4.0.1/jdee-bin-2.4.0.1.zip)
md5sums=('8e1d3e764f01c6dc1e337f9c6882ec85')

build() {
  cd $startdir/src/$pkgname-$pkgver
  mkdir -p $startdir/pkg/usr/share/emacs/site-lisp/$_pkgname

  # Fix up permissions for package files. This is nice but not required.
  find . -type f | xargs chmod 644

  # Because of the way JDEE builds, it assumes the jde directory has its
  # dependencies in sibling directories. We set up some symlinks to fake
  # this.
  ln -sf /usr/share/emacs/site-lisp/elib ../elib
  ln -sf /usr/share/emacs/site-lisp/cedet ../cedet
  # Byte-compile everything.
  emacs -q --no-site-file -batch -l $startdir/jdee-build.el -f jde-compile-jde

  # There is no install per se, just copy everything into the pkg directory.
  cp -R $startdir/src/$pkgname-$pkgver/* \
        $startdir/pkg/usr/share/emacs/site-lisp/$_pkgname

  # Clean up the symlinks.
  rm ../elib
  rm ../cedet
}

# Local Variables:
# mode: shell-script
# End: