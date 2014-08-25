# Maintainer: Miroslav Koskar (http://miroslavkoskar.com/)

# Based on readline-6.1.002-1:
# * Maintainer: Andreas Radke <andyrtr@archlinux.org>
# * Contributor: judd <jvinet@zeroflux.org>

pkgname=readline-vi-mode-changed-hook
_pkgname=readline
_patchlevel=002 #prepare for some patches
_extra_patch="vi_mode_changed_hook.patch"
pkgver=6.1.$_patchlevel
pkgrel=3
pkgdesc="GNU readline library - patched to provide vi mode changed hook"
provides=("readline=${pkgver}")
arch=(i686 x86_64)
url='https://github.com/mkoskar/pkgbuilds/tree/master/readline-vi-mode-changed-hook'
license=('GPL')
depends=('glibc' 'ncurses')
backup=("etc/inputrc")
source=(http://ftp.gnu.org/gnu/readline/readline-6.1.tar.gz
        inputrc
        ${_extra_patch})
if [ $_patchlevel -gt 00 ]; then
    for (( p=1; p<=$_patchlevel; p++ )); do
        source=(${source[@]} http://ftp.gnu.org/gnu/readline/readline-6.1-patches/readline61-$(printf "%03d" $p))
    done
fi
md5sums=('fc2f7e714fe792db1ce6ddc4c9fb4ef3'
         'e5fc955f56d9fa5beb871f3279b8fa8b'
         '69b4ec1736dae1c12f93f493c97520e0'
         'c642f2e84d820884b0bf9fd176bc6c3f'
         '1a76781a1ea734e831588285db7ec9b1')

build() {
  cd ${srcdir}/${_pkgname}-6.1
  for p in ../readline61-*; do
    [ -e "$p" ] || continue
    msg "applying patch ${p}"
    patch -Np0 -i ${p} || return 1
  done

  msg "applying patch ../${_extra_patch}"
  patch -Np0 -i "../${_extra_patch}" || return 1

  # Remove RPATH from shared objects (FS#14366)
  sed -i 's|-Wl,-rpath,$(libdir) ||g' support/shobj-conf

  # build with -fPIC for x86_64 (FS#15634)
  [ $CARCH == "x86_64" ] && CFLAGS="$CFLAGS -fPIC"

  ./configure --prefix=/usr --libdir=/lib \
        --mandir=/usr/share/man --infodir=/usr/share/info
  make SHLIB_LIBS=-lncurses || return 1
  make DESTDIR=${pkgdir} install || return 1

  mkdir -p ${pkgdir}/etc
  install -m644 ../inputrc ${pkgdir}/etc/inputrc || return 1
  #FHS recommends only shared libs in /lib
  mkdir -p $pkgdir/usr/lib
  mv $pkgdir/lib/*.a $pkgdir/usr/lib

  # to make the linker find the shared lib and fix compile issues
  cd ${pkgdir}/usr/lib
  ln -sv /lib/libreadline.so .
  ln -sv /lib/libhistory.so .
}
