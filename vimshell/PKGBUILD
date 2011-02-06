# Contributor: Eugeni Dodonov <eugeni@dodonov.net>
# Based on VIM and GVIM PKGBUILD files.
pkgname=vimshell
pkgver=7.2
pkgrel=1
pkgdesc="Adds support for VimShell patch for VIM and GVIM."
arch=(i686 x86_64)
license=('custom:vim')
url="http://vimshell.wana.at"
depends=('perl' 'python' 'ruby' 'acl' 'gpm>=1.20.4' 'libxt' 'gtk2' 'desktop-file-utils')
makedepends=('wget' 'sed' 'grep')
backup=(etc/vimrc)
conflicts=('vim' 'gvim')
provides=('vim' 'gvim')
install=${pkgname}.install
# we need the extra-stuff to get all patches applied smoothly
source=(ftp://ftp.vim.org/pub/vim/unix/vim-${pkgver}.tar.bz2 \
        ftp://ftp.vim.org/pub/vim/extra/vim-${pkgver}-extra.tar.gz \
        ftp://ftp.vim.org/pub/vim/extra/vim-${pkgver}-lang.tar.gz \
	vimshell.patch.bz2)
md5sums=('f0901284b338e448bfd79ccca0041254'
         '35e04482f07c57221c9a751aaa3b8dac'
         'd8884786979e0e520c112faf2e176f05'
         '257bcfae8c5883d968164bf976fdb97b')

build()
{
  # pull in patches from vim.org (or the src cache alternatively)
  patch -p0 < ${startdir}/src/vimshell.patch || exit 1
  cd ${startdir}/src/vim$(echo ${pkgver} | sed "s/\.//")
  sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' src/feature.h
  # build party
  ./configure --prefix=/usr --localstatedir=/var/lib/vim --mandir=/usr/share/man \
    --with-compiledby=ArchLinux --with-features=big \
    --with-x=yes --enable-gui=gtk2 \
    --with-global-runtime=/usr/share/vim --with-vim-name=vim \
    --enable-multibyte --enable-cscope \
    --enable-perlinterp --enable-pythoninterp --enable-rubyinterp
  make
  make first || return 1
  make || return 1
  make  VIMRCLOC=/etc DESTDIR=${startdir}/pkg VIMRTDIR= install
  cd ${startdir}/pkg/usr/bin
  rm -f ex view rview xxd vimtutor
  ln -s vitutor vimtutor

   # delete the manpages/symlinks provided by vi package
  find ${startdir}/pkg/usr/share/man -type d -name 'man1' 2> /dev/null | \
   while read mandir; do
    cd ${mandir}
    rm -f *.1
    ln -s rvi.1.gz rvim.1.gz
    ln -s vi.1.gz vim.1.gz
    ln -s vidiff.1.gz vimdiff.1.gz
    ln -s vitutor.1.gz vimtutor.1.gz
  done

  # kill the nobackup parts
  sed -i '/vms/,+4 d' ${startdir}/pkg/usr/share/vim/vimrc_example.vim
  install -Dm644 ${startdir}/pkg/usr/share/vim/vimrc_example.vim \
    ${startdir}/pkg/etc/vimrc
  # clean all settings and controls -  served by vi package
  rm -rf ${startdir}/pkg/usr/share/vim
}
