
# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Alexander Duscheleit <jinks@huntemann.uni-oldenburg.de>
pkgname=dovecot-antispam-git
pkgver=20100309
pkgrel=1
pkgdesc="Integrates DSPAM into dovecot IMAP server."
arch=('i686' 'x86_64')
url="http://johannes.sipsolutions.net/Projects/dovecot-antispam"
license=('GPL')
groups=()
depends=('dovecot')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(defconfig)
noextract=()

_gitroot="http://git.sipsolutions.net/dovecot-antispam.git"
_gitname="dovecot-antispam"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # copy config file to build-dir
  cp $srcdir/../defconfig .config

  # fix up Makefile to create directory inside $pkgdir
  sed -i -e 's/install -o/install -D -o/' -e 's|$(INSTALLDIR)/|$(INSTALLDIR)/$(LIBRARY_NAME)|' Makefile

  # BUILD
  make || return 1
  make DESTDIR="$pkgdir/" install
  
  # install manpage
  gzip antispam.7
  install -D -m 0644 -o root -g root antispam.7.gz "$pkgdir/usr/share/man/man7/dovecot-antispam.7.gz"
}
md5sums=('2b488476d4ac578a0b40b504162f1970')
