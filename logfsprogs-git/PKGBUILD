pkgname=logfsprogs-git
pkgver=20120320
pkgrel=1
pkgdesc="LogFS Tools"
arch=('i686' 'x86_64')
url="http://logfs.org"
license=('GPL2')
depends=('zlib' 'glibc')
makedepends=('git')

_gitroot="https://github.com/prasad-joshi/logfsprogs"
_gitname="logfsprogs"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
 else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"

  cd ${srcdir}
  cp -r ${_gitname} ${_gitname}-build
  cd ${_gitname}-build

  msg "Starting make..."

  # Patching the Makefile is a way that does not fail, since sed
  # returns exitcode 0 if the string to replace wasn't found.
  sed -i "s|DESTDIR\t:= /||g" Makefile # Make sure we won't have multiple declarations of DESTDIR if we kept ${srcdir}.
  sed -i "s|BIN\t:= mklogfs|DESTDIR\t:= /\nBIN\t:= mklogfs|g" Makefile # Introduse DESTDIR variable
  sed -i "s|install: all ~/bin|install: all\n\tmkdir \$(DESTDIR)/sbin/|g" Makefile # Install to DESTDIR/sbin/ instead of ~/bin/
  sed -i "s|cp \$(BIN) ~/bin/|cp \$(BIN) \$(DESTDIR)/sbin/|g" Makefile

  make
}

package() {
  cd ${srcdir}/${_gitname}-build
  make DESTDIR=${pkgdir} install
  cd ${srcdir}
  rm -rf ${_gitname}-build
}
