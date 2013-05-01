# Maintainer: jhernberg@alchemy.lu>
# Contributor: Ray Rashif <schiv@archlinux.org>

_pkgbasename=jack1-git
pkgname=lib32-$_pkgbasename
pkgver=0.121.3.58.g5820385
pkgrel=1
pkgdesc="A low-latency audio server (32-bit client libs)"
arch=('x86_64')
url="http://jackaudio.org"
license=('GPL' 'LGPL')
depends=('lib32-glibc' "$_pkgbasename=$pkgver")
makedepends=('git' 'gcc-multilib')
provides=('lib32-jack')
conflicts=('lib32-jack')
replaces=('lib32-jack')
options=('!libtool')

source=("$_pkgbasename::git://github.com/jackaudio/jack1.git"
        'tools-git::git://github.com/jackaudio/tools.git'
        'example-clients-git::git://github.com/jackaudio/example-clients.git')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$_pkgbasename"
  git describe --tags --always | sed 's|-|.|g'
}

prepare()
{
  cd "$srcdir/$_pkgbasename"
  git submodule init
  git config submodule.tools/master.url "$srcdir/tools-git"
  git config submodule.example-clients/master.url "$srcdir/example-clients-git"
  git submodule update
}

build() {
  cd "$srcdir/$_pkgbasename"
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac

  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib32
  make -C libjack
}

package() {
  cd "$srcdir/$_pkgbasename"
  make DESTDIR=${pkgdir} install-pkgconfigDATA
  make -C libjack DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
