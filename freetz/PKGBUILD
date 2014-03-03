# Maintainer: boenki <boenki at gmx dot de>
# Contributor: onny <onny@project-insanity.org>

pkgname=freetz
pkgver=1.2
pkgrel=2
pkgdesc="Build your own firmware for fritzboxes"
url="http://freetz.org"
arch=('any')
source=("$url/downloads/$pkgname-$pkgver.tar.bz2"
        'freetz-copy-repository')
md5sums=('bc2f27dbdd49cfa78fdaf2d2d46d8a4c'
         'e43344ab4ee3d7b7a2d42d0ee5500653')
install="$pkgname.install"
license=('GPL2')
depends=('eclipse-ecj' 'fastjar' 'git' 'graphicsmagick' 'libusb'
         'mtools' 'patchutils' 'perl-string-crc32' 'python' 'python2'
         'ruby' 'subversion' 'syslinux' 'tofrodos' 'unzip' 'xz')
#The group 'base-devel' is assumed to be installed!
#https://wiki.archlinux.org/index.php/Pkgbuild#depends
#Otherwise uncomment the following line before packaging:
#depends+=('autoconf' 'automake' 'bison' 'flex' 'libtool' 'make' 'patch' 'pkg-config')

if test "$CARCH" == x86_64; then
  depends+=('libtool-multilib' 'lib32-ncurses')
else
  depends+=('ncurses')
fi

package() {
  install -Dm755 freetz-copy-repository $pkgdir/usr/bin/freetz-copy-repository
  install -d $pkgdir/opt/$pkgname
  shopt -s dotglob
  cp -r $pkgname-$pkgver/* $pkgdir/opt/$pkgname
}
