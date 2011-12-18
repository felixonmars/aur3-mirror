# Maintainer: Natal Ngétal <hobbestigrou@erakis.im>

pkgname=vim-inteprete
_realname=vim
_srcver=7.3
_patchlevel=$(wget ftp://ftp.vim.org/pub/vim/patches/${_srcver}/ -q -O - | sed -n '/7.3./ s/.*7.3.\([0-9]\+\).*/\1/p' | tail -1)
pkgver=${_srcver}.${_patchlevel}
pkgrel=3
pkgdesc="Vim compiled with Perl, Python, Lua, Ruby interprete, and without gui."
arch=(i686 x86_64)
license=('custom:vim')
url="http://www.vim.org"
depends=('libxt' 'gtk2')
provides=(${_realname})
conflicts=(gvim vim cvim vim-gtk)
source=(ftp://ftp.vim.org/pub/vim/unix/vim-${_srcver}.tar.bz2)
md5sums=('5b9510a17074e2b37d8bb38ae09edbf2')
_python2=n
_vimfolder=${_realname}$(echo ${_srcver} | sed "s/\.//")

if [ ${_python2} = "y" ]; then
  makedepends=('wget' 'sed' 'grep' 'python2' 'perl' 'ruby' 'lua' 'gzip')
else
  makedepends=('wget' 'sed' 'grep' 'python' 'perl' 'ruby' 'lua' 'gzip') 
fi

build() {
  cd ${srcdir}/${_vimfolder}

  wget ftp://ftp.vim.org/pub/vim/patches/${_srcver}/${_srcver}.*
  wget ftp://ftp.vim.org/pub/vim/patches/${_srcver}/MD5SUMS
  md5sum -c MD5SUMS || return 1
  for x in `ls ${_srcver}.*`; do patch -p0 -i $x; done

  if [ ${_python2} = "y" ]; then
    sed -i -e 's|vi_cv_path_python, python|vi_cv_path_python, python2|' \
               ${srcdir}/${_vimfolder}/src/configure.in
    (cd ${srcdir}/${_vimfolder}/src && autoconf)
  fi

  ./configure --prefix=/usr --localstatedir=/var/lib/vim --mandir=/usr/share/man \
              --with-features=big --with-compiledby=ArchLinux \
              --enable-gpm --enable-acl --with-x=no \
              --with-global-runtime=/usr/share/vim \
              --disable-gui --enable-multibyte --enable-cscope \
              --disable-netbeans --enable-perlinterp --enable-pythoninterp --enable-luainterp --enable-rubyinterp
  make || return 1
  make VIMRCLOC=/etc DESTDIR=${pkgdir} install

  # Clean unneeded binary files and man pages
  cd ${pkgdir}/usr/bin
  rm -f ex view rview xxd vimtutor

  find ${pkgdir}/usr/share/man -type d -name 'man1' 2>/dev/null | \
  while read _mandir; do
    cd ${_mandir}
    rm -f ex.1 view.1 vimtutor.1 xxd.1
  done

  # Fix FS#17216
  sed -i 's|messages,/var|messages,/var/log/messages.log,/var|' \
          ${pkgdir}/usr/share/vim/${_vimfolder}/filetype.vim

  # Patch filetype.vim for better handling of pacman related files
  sed -i "s/rpmsave/pacsave/;s/rpmnew/pacnew/;s/,\*\.ebuild/\0,PKGBUILD*,*.install/" \
          ${pkgdir}/usr/share/vim/${_vimfolder}/filetype.vim
  sed -i "/find the end/,+3{s/changelog_date_entry_search/changelog_date_end_entry_search/}" \
          ${pkgdir}/usr/share/vim/${_vimfolder}/ftplugin/changelog.vim

  # License
  install -Dm644 ${srcdir}/${_vimfolder}/runtime/doc/uganda.txt\
    ${pkgdir}/usr/share/licenses/${_realname}/license.txt
}
