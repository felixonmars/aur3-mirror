# $Id: PKGBUILD 82656 2010-06-15 05:20:23Z allan $
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>
# Contributor: judd <jvinet@zeroflux.org>
# Contributor: Mario A. Vazquez
# Contributor: Jerzy Goca <juras256@epf.pl>
# Contributor: Keshav P R

_pkgname="grub"
__pkgname="${_pkgname}-legacy"

# pkgname="${__pkgname}"    ## grub-Legacy without graphics support
pkgname="${__pkgname}-gfx"    ## grub-Legacy with graphics support

pkgver=0.97

## pkgrel follows grub-legacy package in the official repo
pkgrel=18

pkgdesc="GNU GRand Unified Bootloader Legacy version compiled for BIOS systems"

if [ "${pkgname}" == "${__pkgname}-gfx" ]
then
    pkgdesc="GNU GRand Unified Bootloader Legacy version compiled for BIOS systems - with Graphics support"
    echo
fi

arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnu.org/software/grub/grub-legacy.en.html"
# groups=('base')
makedepends=('ncurses')
depends=('bash' 'ncurses')
options=(strip docs !libtool !emptydirs zipman purge)
backup=('boot/grub/menu.lst')
install="${__pkgname}.install"

replaces=('grub')
provides=('grub')

if [ "${pkgname}" == "${__pkgname}-gfx" ]
then
    conflicts=('grub' 'grub-legacy')
    replaces=('grub-gfx')
    provides=('grub' 'grub-legacy' 'grub-gfx')
fi

source=("ftp://alpha.gnu.org/gnu/grub/grub-${pkgver}.tar.gz"
        'menu.lst'
        'install-grub'
        '040_all_grub-0.96-nxstack.patch'
        '05-grub-0.97-initrdaddr.diff'
        'ext4.patch'
        'grub-0.97-gpt.patch'
        'grub-0.97-graphics.patch'
        'grub-0.97-ldflags-objcopy-remove-build-id.patch'
        'grub-inode-size.patch'
        'i2o.patch'
        'intelmac.patch'
        'more-raid.patch'
        'special-devices.patch'
        'splash.xpm.gz')

sha1sums=('2580626c4579bd99336d3af4482c346c95dac4fb'
          '885c39d2819620c70bcd91cb9203d0c9e19b886f'
          'e88a68204c9c9d4bd0b50fa11cab789df4ac55f8'
          '157b81dbad3576536b08642242accfa1aeb093a9'
          'adbb4685c98797ffb4dc83561ec75698991dddbd'
          'a36f34e51efed540f1ddafd78e9c9f6d83e4c8d4'
          '6057a076110d469fb63e56e57711d281221f9b42'
          '0ca831c79c9248cddeeaf055b9276bee14e78be9'
          '61c4b58d2eaa3c1561d8e9d8fc41341ce8882869'
          '0436aa6fa0b6f768289172f983a3f4b69384629e'
          'f2e0dff29a7c8a45e90aa07298a1b2a9a9d29afc'
          '066d7ab1ae442f88e94c9e4f1867ac6682965d06'
          '45fe668a3779664fb292591f426976b6c784d6c8'
          'c5e2c94ed0e759590b9eb38c9d979f075d19d7c0'
          'd1d05c66170fa7ed0dee28cc13de162741debd25')

if [ "${CARCH}" == 'x86_64' ]
then
    makedepends=(${makedepends[@]} 'gcc-multilib' 'gcc-libs-multilib' 'lib32-glibc' 'binutils-multilib' 'libtool-multilib')
    echo
fi

build() {
  
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  ## set destination architecture here
  # DESTARCH="i686"
  DESTARCH="x86_64"
  
  if [ "${pkgname}" == "${__pkgname}-gfx" ]
  then
      ## apply graphics patch
      patch -Np1 -i "${srcdir}/grub-0.97-graphics.patch"
      echo
  fi
  
  ## optimizations break the build -- disable them
  ## adding special devices to grub, patches are from fedora
  patch -Np1 -i "${srcdir}/special-devices.patch"
  patch -Np1 -i "${srcdir}/i2o.patch"
  patch -Np1 -i "${srcdir}/more-raid.patch"
  patch -Np1 -i "${srcdir}/intelmac.patch"
  
  ## Add support for bigger inode size to e2fs_stage1_5
  patch -Np1 -i "${srcdir}/grub-inode-size.patch"
  
  ## Add ext4 support
  ## http://www.mail-archive.com/bug-grub@gnu.org/msg11458.html
  patch -Np1 -i "${srcdir}/ext4.patch"
  
  ## Objcopy and LDFLAGS remove build-id configure and Makefiles patch, taken from grub-fedora git repo
  ## http://git.kernel.org/?p=boot/grub-fedora/grub-fedora.git;a=summary
  patch -Np1 -i "${srcdir}/grub-0.97-ldflags-objcopy-remove-build-id.patch"
  
  ## correcting problems for new wersion of autotools
  sed -e'/^AC_PROG_CC/ a\AM_PROG_CC_C_O\ ' -i "${srcdir}/${_pkgname}-${pkgver}/configure.ac" || true
  sed -e'/^AC_PROG_CC/ a\AM_PROG_AS\ ' -i "${srcdir}/${_pkgname}-${pkgver}/configure.ac" || true
  
  ## recreate ./configure script with the required changes in LDFLAGS and objcopy
  aclocal
  autoconf
  autoreconf
  automake
  
  ## CFLAGS taken from grub-fedora
  # _CFLAGS="-Os -g -fno-strict-aliasing -Wall -Wno-error -Wno-shadow -Wno-unused -Wno-pointer-sign -m32"
  _CFLAGS="-Wall -Wno-error -Wno-unused -m32"
  
  # if [ "${CARCH}" == 'x86_64' ]
  # then
    #    echo "This package has to be built on i686, won't compile on x86_64 without multilib."
    #    sleep 5
  # fi
  
  if [ "${DESTARCH}" == 'x86_64' ]
  then
      _CFLAGS="${_CFLAGS} -static"
      
      ## patch from gentoo for fixing a segfault
      patch -Np1 -i "${srcdir}/040_all_grub-0.96-nxstack.patch"
      
      ## patch from frugalware to make it boot when more than 2GB ram installed
      patch -Np1 -i "${srcdir}/05-grub-0.97-initrdaddr.diff"
  else
      _CFLAGS="${_CFLAGS}"
  fi
  
  CFLAGS="${_CFLAGS}" ./configure --host=i386-pc-linux-gnu \
                                  --disable-auto-linux-mem-opt \
                                  --prefix=/usr --bindir=/bin --sbindir=/sbin \
                                  --mandir=/usr/share/man --infodir=/usr/share/info \
                                  --libdir=/usr/lib
  
  CFLAGS="" make
  
}

package() {
  
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  make DESTDIR="${pkgdir}" install
  
  install -D -m644 "${srcdir}/menu.lst" "${pkgdir}/boot/grub/menu.lst"
  
  if [ "${pkgname}" == "${__pkgname}-gfx" ]
  then
      ## install the splash image file
      install -D -m644 "${srcdir}/splash.xpm.gz" "${pkgdir}/boot/grub/splash.xpm.gz"
      echo
  fi
  
  install -D -m755 "${srcdir}/install-grub" "${pkgdir}/sbin/install-grub"
  
  if [ "${DESTARCH}" == 'x86_64' ]
  then
      ## fool makepkg into building a x86_64 package
      export CARCH="x86_64"
      echo
  fi
  
}
