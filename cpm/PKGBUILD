# Maintainer: Daniel Mendler <mail at daniel-mendler.de>
# Contributor: Daniel Mendler <mail at daniel-mendler.de>
pkgname=cpm
pkgver=20110324
pkgrel=1
pkgdesc='Curses based password manager using PGP-encryption'
arch=(i686 x86_64)
url='http://github.com/comotion/cpm'
license=(GPL)
depends=(dotconf libxml2 gpgme)
makedepends=(git libcdk)

_gitroot='git://github.com/comotion/cpm.git'
_gitname='cpm'

build() {
  cd $srcdir
  msg 'Connecting to GIT server....'

  if [ -d $_gitname ] ; then
    (cd $_gitname; git pull origin)
    msg 'The local files are updated.'
  else
    git clone $_gitroot $_gitname
  fi

  msg 'GIT checkout done or server timeout'

  cd cpm
  ./configure --prefix=/usr --with-cracklib-dict=/usr/share/cracklib/pw_dict
  make
}

package() {
  cd $srcdir/cpm
  install -D -m755 cpm $pkgdir/usr/bin/cpm
}

setconf() {
  local tmp="$1.tmp"
  mv "$1" "$tmp"
  sed "s|$2[^=]*=.*|$2=$3|" "$tmp" > "$1"
  rm -f "$tmp"
}
