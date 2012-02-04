# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=sdcv
pkgver=0.4.2
pkgrel=5
pkgdesc="StarDict Console Version"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net/index.php"
license=('GPL')
depends=('glib2' 'readline' 'zlib')
makedepends=('patch')
provides=('stardict')
#options=('!makeflags')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2 \
        $pkgname-$pkgver-headers.patch)
md5sums=('f624662b333daa5da2d3e99cef519f17'
         '76cd68bbf4662f3ab9e1d82822f0a0c6')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  patch -Np1 -i ${srcdir}/$pkgname-$pkgver-headers.patch || return 1

  ./configure --prefix=/usr  --mandir=/usr/share/man
#quick fix for x86_64 (zeus)
  if [ "${CARCH}" == "x86_64" ]; then
    sed -i 's|guint32 page_size|guint64 page_size|' src/lib/lib.cpp
  fi

  make || return 1
  make DESTDIR=${pkgdir} install
}

