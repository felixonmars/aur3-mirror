# Maintainer: Alberto Corona <albcoron@gmail.com>

pkgname=vim-python2-hg
pkgver=7.4.383
pkgrel=1
pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor. Compiled with python2 support.'
arch=('i686' 'x86_64')
license=('custom:vim')
url="http://www.vim.org"
depends=('gpm' 'perl' 'gawk' 'python2')
makedepends=('gpm' 'mercurial')
conflicts=('vim' 'vim-runtime')
provides=('vim=7.4' 'vim-runtime=7.4')
source=('hg+http://vim.googlecode.com/hg/vim'
        'vimrc'
        'archlinux.vim')
md5sums=('SKIP'
         '20fceda56badf201695c57999b0bc609'
         '10353a61aadc3f276692d0e17db1478e')
backup=('etc/vimrc')

pkgver() {
  cd vim
  hg tip --template '{latesttag}\n' | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/vim/src"

  # define the place for the global (g)vimrc file (set to /etc/vimrc)
  sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' \
    feature.h
  sed -i 's|^.*\(#define VIMRC_FILE.*"\) .*$|\1|' \
    feature.h

  autoconf

  ./configure \
    --prefix=/usr \
    --localstatedir=/var/lib/vim \
    --with-features=big \
    --with-compiledby=ArchLinux \
    --enable-gpm \
    --enable-acl \
    --with-x=no \
    --disable-gui \
    --enable-multibyte \
    --enable-cscope \
    --disable-netbeans \
    --enable-perlinterp \
    --enable-pythoninterp \
    --with-python-config-dir=/usr/lib/python2.7/config \
    --disable-python3interp \
    --disable-rubyinterp \
    --disable-luainterp

  make
}

package() {
  cd "$srcdir/vim"
 
  IFS='.' read MAJOR MINOR PATCH <<< "$pkgver"
  versiondir=vim$MAJOR$MINOR

  make VIMRCLOC=/etc DESTDIR=$pkgdir install

  # provided by (n)vi in core
  rm "${pkgdir}"/usr/bin/{ex,view}

  # delete some manpages
  find "${pkgdir}"/usr/share/man -type d -name 'man1' 2>/dev/null | \
    while read _mandir; do
    cd ${_mandir}
    rm -f ex.1 view.1 # provided by (n)vi
    rm -f evim.1    # this does not make sense if we have no GUI
  done

  install -dm755 "${pkgdir}"/usr/share

  # Don't forget logtalk.dict
  install -Dm644 "${srcdir}"/vim/runtime/ftplugin/logtalk.dict \
    "${pkgdir}"/usr/share/vim/${versiondir}/ftplugin/logtalk.dict

  # fix FS#17216
  sed -i 's|messages,/var|messages,/var/log/messages.log,/var|' \
    "${pkgdir}"/usr/share/vim/${versiondir}/filetype.vim

  # patch filetype.vim for better handling of pacman related files
  sed -i "s/rpmsave/pacsave/;s/rpmnew/pacnew/;s/,\*\.ebuild/\0,PKGBUILD*,*.install/" \
    "${pkgdir}"/usr/share/vim/${versiondir}/filetype.vim
  sed -i "/find the end/,+3{s/changelog_date_entry_search/changelog_date_end_entry_search/}" \
    "${pkgdir}"/usr/share/vim/${versiondir}/ftplugin/changelog.vim

  # rc files
  install -Dm644 "${srcdir}"/vimrc "${pkgdir}"/etc/vimrc
  install -Dm644 "${srcdir}"/archlinux.vim \
    "${pkgdir}"/usr/share/vim/${versiondir}/archlinux.vim

  # rgb.txt file
  install -Dm644 "${srcdir}"/vim/runtime/rgb.txt \
    "${pkgdir}"/usr/share/vim/${versiondir}/rgb.txt

  # license
  install -Dm644 "${srcdir}"/vim/runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt

}

# vim:set ts=2 sw=2 et:
