# Maintainer: Ruan Wessels <ruan9422@gmail.com>
# Contributor: Benjamin Jorand <benjamin.jorand@gmail.com>
# Contributor: Jens Maucher <defcon@archlinux.us>
# Contributor: Emmanuel Gras <gras.emmanuel@gmail.com>

pkgname=ksplice
pkgver=0.9.9
pkgrel=2
pkgdesc="Update the Linux kernel without rebooting"
arch=('i686' 'x86_64')
url="http://www.ksplice.com/"
license=('GPL2')
source=(http://pkgs.fedoraproject.org/repo/pkgs/ksplice/ksplice-0.9.9-src.tar.gz/ceb4301c51d9b075731050b57d9ecd80/ksplice-0.9.9-src.tar.gz)
md5sums=('ceb4301c51d9b075731050b57d9ecd80')

build() {
  cd $srcdir/$pkgname-$pkgver

  # Package to /usr/bin instead of /usr/sbin
  sed -i 's|/sbin|/bin|g' ./configure 

  ./configure --prefix=/usr \
      --with-libbfd=/usr/lib/libbfd.a \
      --with-libiberty=/usr/lib/libiberty.a \
      --libexecdir=/usr/lib/ksplice

  # patch Makefile
  sed -i 's/^LIBS = .*$/& -ldl/' Makefile

  # Fix obscure pod2man error by only converting what seem to be man pages
  sed -i 's/^perl_man =.*$/perl_man = ksplice-create.8 ksplice-view.8 ksplice-apply.8 ksplice-undo.8/' Makefile

  # define PACKAGE_VERSION to fix bfd.h error
  sed -i "s/#include \"objcommon.h\"/#define PACKAGE_VERSION $pkgver\n&/" *.c

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

