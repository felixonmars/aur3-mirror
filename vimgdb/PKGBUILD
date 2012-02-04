# Maintainer: Laszlo Papp <djszapi at gmail com>

pkgname=vimgdb
conflicts=('vim')
provides=('vim')
_srcver=7.2
_patchlevel=245
pkgver=${_srcver}.${_patchlevel}
pkgrel=2
pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor, with gdb support'
arch=('i686' 'x86_64')
license=('custom:vim')
url="http://clewn.sourceforge.net/"
depends=('gpm' 'python' 'libxt')
makedepends=('wget' 'sed' 'grep' 'gettext' 'perl')
optdepends=('perl: the runtime provides a few useful perl scripts')
backup=(etc/vimrc)
install=${pkgname}.install
# we need the extra-stuff to get all patches applied smoothly
source=(ftp://ftp.vim.org/pub/vim/unix/vim-${_srcver}.tar.bz2 \
        ftp://ftp.vim.org/pub/vim/extra/vim-${_srcver}-extra.tar.gz \
        ftp://ftp.vim.org/pub/vim/extra/vim-${_srcver}-lang.tar.gz \
        fetch_patches.sh fetch_runtime.sh vimrc archlinux.vim \
        vim72gdb.diff \
        vimgdb72-1.14.tar.gz::http://sourceforge.net/projects/clewn/files/vimGdb/vimgdb72-1.14/vimgdb72-1.14.tar.gz/download)
md5sums=('f0901284b338e448bfd79ccca0041254' '35e04482f07c57221c9a751aaa3b8dac' \
         'd8884786979e0e520c112faf2e176f05' '6d7e8d7868e8bfaa9a5880cd9c439320' \
         '45c1c3c6aff7de0d8fc2a9d8cd5cec7d' '29125bedc96f2a58c772ee0455a333bc' \
         '10353a61aadc3f276692d0e17db1478e' \
         '70afd3f610c26cda2710b1864aff5721' 'e406c64d29a3152a3f5d0fffe3d2bba8')

build()
{
  local _versiondir="vim"$(echo ${_srcver} | sed "s/\.//")
  # pull in patches from vim.org (or the src cache alternatively)
  . ${srcdir}/fetch_patches.sh
  . ${srcdir}/fetch_runtime.sh
  get_patches || return 1

  # remove files that the gdb patch creates (patch doesn't like overwriting)
  local i
  for i in proto/gdb.pro gdb.c clewn/gdb.h clewn/gdb_lvl2.c clewn/gdb_lvl3.c \
           clewn/misc.c clewn/misc.h clewn/obstack.c clewn/obstack.h
  do
    rm -f "${srcdir}/${_versiondir}/src/$i"
  done

  patch -d ${srcdir}/${_versiondir} -p0 < ${srcdir}/vim72gdb.diff || return 1

  cd ${srcdir}/${_versiondir}
  sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' src/feature.h
  sed -i 's|^.*\(#define VIMRC_FILE.*"\) .*$|\1|' src/feature.h
  # build party
  ./configure --prefix=/usr --localstatedir=/var/lib/vim --mandir=/usr/share/man \
    --with-compiledby=ArchLinux --with-features=big \
    --enable-gpm --enable-acl --with-x=no --disable-gui \
    --enable-multibyte --enable-cscope \
    --enable-perlinterp --enable-gdb --enable-pythoninterp --with-x
    #--with-global-runtime=/usr/share/vim --with-vim-name=vim \
  make || return 1
  make  VIMRCLOC=/etc DESTDIR=${pkgdir} install
  cd ${pkgdir}/usr/bin
  rm ex view          # provided by (n)vi in core
  mv vim vim-normal   # we create a vim-symlink on post_install
  ln -sf vim-normal vim
  # ... make g* related symlinks point directly to the actual binary
  ln -sf vim-normal rview
  ln -sf vim-normal rvim
  ln -sf vim-normal vimdiff

  # delete some manpages
  find ${pkgdir}/usr/share/man -type d -name 'man1' 2> /dev/null | \
   while read mandir; do
    cd ${mandir}
    rm -f ex.1 view.1       # provided by (n)vi
    rm -f evim.1            # this does not make sense in the console version
  done

  _runtimedir="${pkgdir}/usr/share/vim/${_versiondir}/"
  update_runtime

  # extract the vimgdb runtime into the runtime directory
  cd ${srcdir}/vimgdb
  bsdtar -xzf vimgdb_runtime.tgz
  install -m644 doc/gdb.txt "${pkgdir}/usr/share/vim/${_versiondir}/doc/gdb.txt"
  install -m644 macros/gdb_mappings.vim "${pkgdir}/usr/share/vim/${_versiondir}/macros/gdb_mappings.vim"
  install -m644 syntax/gdb{,var,vim}.vim "${pkgdir}/usr/share/vim/${_versiondir}/syntax/"

  cd ${srcdir}/${_versiondir}
  install -Dm644 ${srcdir}/vimrc  ${pkgdir}/etc/vimrc
  install -Dm644 ${srcdir}/archlinux.vim  \
                 ${pkgdir}/usr/share/vim/vimfiles/archlinux.vim
  install -dm755 ${pkgdir}/usr/share/licenses/vimgdb/vim
  cd ${pkgdir}/usr/share/licenses/vimgdb/vim
  ln -s ../../../vim/${_versiondir}/doc/uganda.txt license.txt
}
