# Maintainer: Viktor Semykin thesame.ml at gmail dot com
pkgname=vim-xft-hg
pkgver=7.3
pkgrel=20120124
dirname=vim
pkgdesc="Improved version of the vi text editor with XFT font support"
url="http://www.vim.org"
arch=('x86_64' 'i686')
license=('custom:vim')
depends=('openmotif')
optdepends=()
makedepends=()
conflicts=('vi' 'vim' 'gvim' 'vim-runtime')
provides=('vi' 'vim' 'gvim' 'vim-runtime')
replaces=()
backup=()
install=
_repo=thesameml-vim-xft
_commit='c9b6179be30fdc487f7fdefb7bac25cd3b7e8095'
source=("http://${_repo}.googlecode.com/archive/${_commit}.zip")
md5sums=('30adba574ea364986da02adeb74fe79c')

build() {
  cd "${srcdir}/${_repo}-${_commit:0:12}"

  find -name configure -exec chmod +x {} \;
  find -name \*.sh -exec chmod +x {} \;
  find -name mkinstalldirs -exec chmod +x {} \;

  ./configure --prefix=/usr --localstatedir=/var/lib/vim \
    --with-features=big --with-compiledby=ArchLinux \
    --enable-gpm --enable-acl --with-x=yes \
    --enable-gui=motif --enable-xft --enable-multibyte --enable-cscope \
    --disable-netbeans --disable-perlinterp --disable-pythoninterp \
    --disable-python3interp --disable-rubyinterp --disable-luainterp

  make
}

package() {
  cd "${srcdir}/${_repo}-${_commit:0:12}"

  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install

  ln -s "${pkgdir}/usr/bin/vim" "${pkgdir}/usr/bin/vi"

  install -Dm644 runtime/doc/uganda.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

