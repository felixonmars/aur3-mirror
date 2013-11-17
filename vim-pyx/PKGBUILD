# Maintainer: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: tobias [ tobias at archlinux org ]
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Mikhail "Pyromaniac" Burakov <m-burakov@ya.ru>

pkgname=vim-pyx
pkgver=7.4.86
pkgrel=1
arch=('i686' 'x86_64')
license=('custom:vim')
url="http://www.vim.org"
makedepends=('gpm')
provides=('vim')
source=("ftp://ftp.archlinux.org/other/vim/vim-${pkgver}.tar.xz")
md5sums=('436d4d3c6402ce20309bf2cdedce63c0')

build() {
  cp -a vim-${pkgver} vim-build

  (cd vim-build/src && autoconf)

  cd "${srcdir}"/vim-build

  ./configure \
    --prefix=/usr \
    --localstatedir=/var/lib/vim \
    --with-features=huge \
    --with-compiledby='Pyromaniac' \
    --enable-gpm \
    --enable-acl \
    --with-x=yes \
    --disable-gui \
    --enable-multibyte \
    --enable-cscope \
    --disable-netbeans \
    --disable-perlinterp \
    --disable-pythoninterp \
    --enable-python3interp \
    --disable-rubyinterp \
    --disable-luainterp

  make
}

package() {
  pkgdesc='Console-only vim with python3 and x11 support'
  depends=("vim-runtime=${pkgver}-${pkgrel}" 'gpm')
  conflicts=('vim' 'gvim')

  cd "${srcdir}"/vim-build
  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install

  # provided by (n)vi in core
  rm "${pkgdir}"/usr/bin/{ex,view}

  # delete some manpages
  find "${pkgdir}"/usr/share/man -type d -name 'man1' 2>/dev/null | \
    while read _mandir; do
    cd ${_mandir}
    rm -f ex.1 view.1 # provided by (n)vi
    rm -f evim.1    # this does not make sense if we have no GUI
  done

  # Runtime provided by runtime package
  rm -r "${pkgdir}"/usr/share/vim

  # license
  install -Dm644 "${srcdir}"/vim-${pkgver}/runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/vim/license.txt
}

# vim:set sw=2 sts=2 et:
