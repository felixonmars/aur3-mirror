# Contributor: Baumi <baumi@gmx.com>

pkgname=he220stat
pkgver=1
pkgrel=1
pkgdesc=""
arch=('i686')
url="http://oozie.fm.interia.pl/pro/huawei-e220/"
license=('GPL')
source=(http://oozie.fm.interia.pl/src/he220stat.tar.bz2 
        he220stat_patch)
md5sums=('aa800f85183dc1990102846773fbefd9'
         '19453da6a6aa95a59b413ee7505876fc') 

build() {

  cp "$startdir/he220stat_patch" "$startdir/src/he220stat-0x03"
  cd "$startdir/src/he220stat-0x03"

  ./configure --prefix=/usr

  patch -Np0 -i "./he220stat_patch" || return 1

  make || return 1
  make DESTDIR="$startdir/pkg" install
}

# vim:set ts=2 sw=2 et:
