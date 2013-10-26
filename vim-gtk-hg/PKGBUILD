# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: EEva <eeva@marvid.fr>
# Contributor: Barthalion <aur@bpiotrowski.pl>
pkgname=vim-gtk-hg
_vimfolder=vim
pkgver=5404.92c9748e0ccb
pkgver() {
  cd ${_vimfolder}
  echo $(hg identify -n).$(hg identify -i)
}
pkgrel=1
pkgdesc="Modified from extra/gvim, compiled with gtk2 ui, without deps on vi/vim, ruby and desktop utils."
arch=(i686 x86_64)
license=('custom:vim')
url="http://www.vim.org"
depends=('libxt' 'gtk2')
provides=(vim)
conflicts=(gvim vim vim-runtime)
md5sums=('SKIP')

_python2=n

if [ ${_python2} = "y" ]; then
  makedepends=('mercurial' 'wget' 'sed' 'grep' 'python2' 'perl' 'gzip')
else
  makedepends=('mercurial' 'wget' 'sed' 'grep' 'python' 'perl' 'gzip') 
fi

_hgroot=https://code.google.com/p
_hgrepo=vim
source=("${_vimfolder}::hg+${_hgroot}/${_hgrepo}")

build() {
  cd ${srcdir}/${_vimfolder}

  if [ ${_python2} = "y" ]; then
    sed -i -e 's|vi_cv_path_python, python|vi_cv_path_python, python2|' \
               ${srcdir}/${_vimfolder}/src/configure.in
    (cd ${srcdir}/${_vimfolder}/src && autoconf)
  fi

  ./configure --prefix=/usr --localstatedir=/var/lib/vim --mandir=/usr/share/man \
              --with-features=big \
              --with-x=yes --disable-gpm --with-x=yes --enable-gui=gtk2 \
              --with-global-runtime=/usr/share/vim\
              --enable-multibyte --enable-cscope \
              --enable-perlinterp --enable-pythoninterp
  make
}

package() {
  cd ${srcdir}/${_vimfolder}

  make VIMRCLOC=/etc DESTDIR=${pkgdir} install

  # Clean unneeded binary files and man pages
  cd ${pkgdir}/usr/bin
  rm -f ex view rview xxd vimtutor

  find ${pkgdir}/usr/share/man -type d -name 'man1' 2>/dev/null | \
  while read _mandir; do
    cd ${_mandir}
    rm -f ex.1 view.1 vimtutor.1 xxd.1
  done

  # License
  install -Dm644 ${srcdir}/${_vimfolder}/runtime/doc/uganda.txt\
    ${pkgdir}/usr/share/licenses/${_realname}/license.txt
}
