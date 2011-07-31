# Contributor: Eric Pignet <eric at erixpage dot com>

pkgname=neposync-git
pkgver=20110731
pkgrel=1
pkgdesc="A tool to synchronize files metadata with Nepomuk or Amarok"
arch=(i686 x86_64)
license=('GPL')
url="http://wiki.github.com/ericpignet/neposync"
depends=('libkexiv2' 'qt>=4.3' libmysqlclient taglib openssl)
makedepends=('git')
source=()
md5sums=()

_gitroot=git://github.com/ericpignet/neposync.git
_gitname=neposync

build() {
if [ -d $startdir/src/$_gitname ]
then
    cd $startdir/src/$_gitname && git pull
else
    cd $startdir/src && git clone $_gitroot && cd $_gitname
fi

qmake && make || return 1
cd $srcdir/$_gitname
install -Dm755 $_gitname $pkgdir/usr/bin/$_gitname || return 1
}
