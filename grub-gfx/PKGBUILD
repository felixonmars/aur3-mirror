# $Id: PKGBUILD 142375 2011-11-08 22:04:23Z ronald $
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Maintainer: ava1ar <mail(dot)avatar(at)gmail(dot)com>

pkgname=grub-gfx
_srcname=grub
pkgver=0.97
pkgrel=23
pkgdesc="A GNU multiboot boot loader"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnu.org/software/grub/"
depends=('ncurses' 'diffutils' 'sed')
conflicts=('grub' 'grub-legacy')
[ "$CARCH" = 'x86_64' ] && makedepends=('gcc-multilib')
optdepends=('xfsprogs: freezing of xfs /boot in install-grub script')
source=(ftp://alpha.gnu.org/gnu/grub/${_srcname}-${pkgver}.tar.gz
        menu.lst
        install-grub
        040_all_grub-0.96-nxstack.patch
        05-grub-0.97-initrdaddr.diff
        i2o.patch
        special-devices.patch
        more-raid.patch
        intelmac.patch
        grub-inode-size.patch
        ext4.patch
        grub-0.97-ldflags-objcopy-remove-build-id.patch
        automake-pkglib.patch
        splash.xpm.gz
        grub-0.97-graphics.patch
)
backup=('boot/grub/menu.lst')
install=grub.install

build() {
  cd ${srcdir}/${_srcname}-${pkgver}

  # optimizations break the build -- disable them
  # adding special devices to grub, patches are from fedora
  patch -Np1 -i ../special-devices.patch
  patch -Np1 -i ../i2o.patch
  patch -Np1 -i ../more-raid.patch
  patch -Np1 -i ../intelmac.patch
  # Add support for bigger inode size to e2fs_stage1_5
  patch -Np1 -i ../grub-inode-size.patch
  # Add ext4 support
  # http://www.mail-archive.com/bug-grub@gnu.org/msg11458.html
  patch -Np1 -i ../ext4.patch
  # binutils fix
  patch -Np1 -i ../grub-0.97-ldflags-objcopy-remove-build-id.patch
  # "pkglib" is a reserved keyword in automake fix
  patch -Np1 -i ../automake-pkglib.patch
  patch -Np1 -i ../grub-0.97-graphics.patch

  sed -e'/^AC_PROG_CC/ a\AM_PROG_CC_C_O\ ' -i "${srcdir}/${_srcname}-${pkgver}/configure.ac"
  sed -e'/^AC_PROG_CC/ a\AM_PROG_AS\ ' -i "${srcdir}/${_srcname}-${pkgver}/configure.ac"

  ## recreate ./configure script with the required changes in LDFLAGS and objcopy
  aclocal
  autoconf
  autoreconf
  automake

  if [ "$CARCH" = "x86_64" ]; then
    # patch from gentoo for fixing a segfault
    patch -Np1 -i ../040_all_grub-0.96-nxstack.patch
    # patch from frugalware to make it boot when more than 2GB ram installed
    patch -Np1 -i ../05-grub-0.97-initrdaddr.diff
    CFLAGS="-static -fno-strict-aliasing" ./configure --prefix=/usr --bindir=/bin --sbindir=/sbin \
                         --mandir=/usr/share/man --infodir=/usr/share/info
  else
    CFLAGS="-fno-strict-aliasing" ./configure --prefix=/usr --bindir=/bin --sbindir=/sbin \
                --mandir=/usr/share/man --infodir=/usr/share/info
  fi
}

package() {
  cd ${srcdir}/${_srcname}-${pkgver}

  CFLAGS= make
  make DESTDIR=${pkgdir} install
  install -D -m644 ../menu.lst ${pkgdir}/boot/grub/menu.lst
  install -D -m755 ../install-grub ${pkgdir}/sbin/install-grub
  install -D -m644 "${srcdir}/splash.xpm.gz" $pkgdir/boot/grub/splash.xpm.gz

}
md5sums=('cd3f3eb54446be6003156158d51f4884'
         'b3150de8306f4b041e74cf851ea6c4db'
         '8c16f2b6fb3f8d5a37c3cd8574aa7783'
         'eb9d69c46af3a0667c1f651817d7f075'
         'ccd2d757e79e3a03dc19ede7391ed328'
         '826fdbf446067f9861baf9f6a69a4583'
         '49f6d4bcced0bc8bbcff273f3254bbfa'
         'f41f702014a064918d7afc6fc23baa6e'
         '175dc6b9f4ab94e8056c3afb3e34460a'
         '69c648d2b8d0965df70a74014424f31c'
         '39e0f9a05b7e04aceb24fc7bc4893e3d'
         '32a584704328c8f375e1610ae4d324f8'
         '6a0236d04d7b75667817a020deec035a'
         '342f59f24cf5de5f013eacda68e617eb'
         '12f043616b51ce2ba82e46c9186a528d')
