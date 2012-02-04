# Contributor: osily <ly50247@gmail.com>
# Maintainer: tobias [ tobias at archlinux org ]
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vim-x-py
pkgdesc='Vi Improved, a highly configurable, improved version of the vi text editor. With X and pyton2 support.'
pkgver=7.3.401
pkgrel=2
arch=('i686' 'x86_64')
license=('custom:vim')
url="http://www.vim.org"
depends=("vim-runtime" 'gpm')
makedepends=('gpm' 'libxt')
conflicts=('gvim' 'vim')
provides=('vim=7.3')
source=(ftp://ftp.archlinux.org/other/vim/vim-${pkgver}.tar.xz)

md5sums=('75fe4772a97917f5eb4c919882fc44bd')

build() {
  cd "${srcdir}"

  mv vim-${pkgver} vim-build

  # define the place for the global (g)vimrc file (set to /etc/vimrc)
  sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' \
    vim-build/src/feature.h
  sed -i 's|^.*\(#define VIMRC_FILE.*"\) .*$|\1|' \
    vim-build/src/feature.h

  # fix python name
  sed -i -e 's|vi_cv_path_python, python|vi_cv_path_python, python2|' \
    vim-build/src/configure.in
  (cd vim-build/src && autoconf)

  cd "${srcdir}"/vim-build

  ./configure --prefix=/usr --localstatedir=/var/lib/vim \
    --with-features=big --with-compiledby=ArchLinux \
    --enable-gpm --enable-acl --with-x=yes \
    --disable-gui --enable-multibyte --enable-cscope \
    --disable-netbeans --enable-perlinterp --enable-pythoninterp \
    --disable-python3interp --disable-rubyinterp --disable-luainterp

  make
}

package() {
  cd "${srcdir}"/vim-build
  make VIMRCLOC=/etc DESTDIR="${pkgdir}" install

  # Runtime provided by runtime package
  rm -r "${pkgdir}"/usr/share/vim

  # license
  install -Dm644 "${srcdir}"/vim-build/runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/vim/license.txt
}

# vim:set sw=2 sts=2 et:
