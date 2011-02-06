# $Id: PKGBUILD 356 2008-04-18 22:56:27Z aaron $
# Maintainer: Thomas Baechler <thomas@archlinux.org>
# Contributor: Gabriel Morrison <gdantas2@gmail.com>

pkgname=b43-fwcutter-patched
_realname=b43-fwcutter
pkgver=012
pkgrel=1
pkgdesc="firmware extractor for the bcm43xx kernel module. Patched with Fedora patches to support newer firmware version."
url="http://linuxwireless.org/en/users/Drivers/b43"
depends=('glibc')
license=('GPL')
conflicts=('b43-fwcutter')
provides=('b43-fwcutter')
arch=('i686' 'x86_64')
source=(http://bu3sch.de/b43/fwcutter/${_realname}-${pkgver}.tar.bz2
	0001-fwcutter-mklist.py-Update-to-new-library-and-skip-so.patch
	0002-fwcutter-Add-two-new-sources-for-478.104-firmware.patch
	0003-fwcutter-Use-ARRAY_SIZE.patch)

build()
{
  cd $startdir/src/${_realname}-$pkgver
  patch -Np2 -i "${srcdir}/0001-fwcutter-mklist.py-Update-to-new-library-and-skip-so.patch" || return 1
  patch -Np2 -i "${srcdir}/0002-fwcutter-Add-two-new-sources-for-478.104-firmware.patch" || return 1
  patch -Np2 -i "${srcdir}/0003-fwcutter-Use-ARRAY_SIZE.patch"
  make || return 1
  install -D -m755 b43-fwcutter $startdir/pkg/usr/bin/b43-fwcutter || return 1
  install -D -m644 b43-fwcutter.1 $startdir/pkg/usr/share/man/man1/b43-fwcutter.1 || return 1
}

md5sums=('69eadf67b459f313a8d6b37aaabef96c'
         '5eae66f91c8cfd61dd71a3e48882f189'
         '27f987e6161e5450afc6fdc23f5a2fcf'
         '643c62ea370a85d4accc5cc908fe5b86')
