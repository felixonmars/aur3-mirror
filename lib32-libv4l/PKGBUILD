# Contributor: snsotorm <snostormjp@gmail.com>

pkgname=lib32-libv4l
_i686pkgname=libv4l
pkgver=0.6.4
pkgrel=1
pkgdesc="Userspace library for Video 4 Linux (1 and 2)"
arch=('x86_64')
url="http://linuxtv.org/hg/v4l-dvb"
license=('LGPL')
depends=('lib32-glibc')
source=(http://archlinux.puzzle.ch/extra/os/i686/${_i686pkgname}-${pkgver}-${pkgrel}-i686.pkg.tar.gz)
md5sums=('7d020e24bbaec925f27953f0f7adca84')

build()
{
  mkdir -p $startdir/pkg/opt/lib32/usr
  rm -rf $startdir/src/usr/lib/pkgconfig
  cp -R $startdir/src/usr/lib $startdir/pkg/opt/lib32/usr/lib
}
