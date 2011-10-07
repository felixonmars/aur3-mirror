# $Id: PKGBUILD 52537 2011-07-26 04:21:21Z svenstaro $
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Sven Kauber, <celeon@gmail.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=encfs-trueondemand
pkgver=1.7.4
pkgrel=5
pkgdesc='This patched version of EncFS will ask for password only when you access to mountpoint with the --ondemand option. Also accepts a SIGUSR1 signal for unmounting.'
arch=('i686' 'x86_64')
url='http://code.google.com/p/encfs/issues/detail?id=122'
license=('GPL')
depends=('rlog' 'openssl' 'fuse' 'boost-libs')
makedepends=('boost')
conflicts=('encfs')
options=('!libtool')
source=("http://encfs.googlecode.com/files/encfs-${pkgver}.tgz" "true_ondemand.patch")
md5sums=('ac90cc10b2e9fc7e72765de88321d617' '08febb83aa2d3870d4da4a08cd32cee3')

build(){
  cd encfs-${pkgver}
  patch -Np1 -i ../../true_ondemand.patch

  ./configure \
    --prefix=/usr

  make
}

package() {
  cd encfs-${pkgver}

  make DESTDIR=${pkgdir} install
}
