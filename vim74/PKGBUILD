# Maintainer: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: tobias [ tobias at archlinux org ]
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Seletskiy Stanislav <s.seletskiy@gmail.com>

### NOTE!
### In order to use this package you should first run:
### bash -c 'source PKGBUILD && mksource'

pkgbase=vim
pkgdesc='Vim 7.4 beta (mercurial) with python, ruby and X11 support'
pkgname=vim74
_topver=7.4a
_patchlevel=44
__hgrev=647596ab1ae2
_versiondir="vim${_topver//./}"
pkgver=${_topver}.${_patchlevel}
pkgrel=1
arch=('i686' 'x86_64')
license=('custom:vim')
url="http://www.vim.org"
makedepends=('gpm' 'python2' 'ruby' 'libxt' 'desktop-file-utils' 'gtk2')
conflicts=('vim' 'vim-runtime')
source=(
  'archlinux.vim'
  'vimrc')
md5sums=(
  '10353a61aadc3f276692d0e17db1478e'
  '20fceda56badf201695c57999b0bc609')


# source PKGBUILD && mksource
mksource() {
  [[ -x /usr/bin/hg ]] || (echo "hg not found. Install mercurial." && return 1)

  __hgroot='http://vim.googlecode.com/hg/'
  __hgrepo='vim'
  __hgbranch='default'

  hg clone -b ${__hgbranch} -u ${__hgrev} "${__hgroot}${__hgrepo}" ${__hgrepo}

  pushd ${__hgrepo}
  if (( $(hg id -n) < $(hg id -nr ${__hgbranch}) )); then
    printf 'You are not building the latest revision!\n'
    printf "Consider updating __hgrev to $(hg id -r ${__hgbranch}).\n"
  fi
  popd

  mv vim ${pkgname}-${pkgver}
  find ${pkgname}-${pkgver} -depth -type d -name .hg -exec rm -rf {} \;
  rm ${pkgname}-${pkgver}/{.hgignore,.hgtags}

  cp -a ${pkgname}-${pkgver} src/
}

build() {
  cp -a ${pkgname}-${pkgver} vim-build

  # define the place for the global (g)vimrc file (set to /etc/vimrc)
  sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' \
    vim-build/src/feature.h
  sed -i 's|^.*\(#define VIMRC_FILE.*"\) .*$|\1|' \
    vim-build/src/feature.h

  (cd vim-build/src && autoconf)

  cd "${srcdir}"/vim-build

  ./configure \
    --prefix=/usr \
    --localstatedir=/var/lib/vim \
    --with-features=huge \
    --with-compiledby='Arch Linux' \
    --enable-gpm \
    --enable-acl \
    --with-x=yes \
    --enable-multibyte \
    --enable-cscope \
    --disable-netbeans \
    --disable-perlinterp \
    --enable-pythoninterp \
    --enable-python3interp \
    --enable-rubyinterp \
    --disable-luainterp

    #--disable-gui \

  make
}

check() {
  # disable tests because they seem to freeze

  cd "${srcdir}"/vim-build

  #make test
}

package_vim74() {
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

  # license
  install -Dm644 "${srcdir}"/vim-build/runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}

# vim:set sw=2 sts=2 et:
