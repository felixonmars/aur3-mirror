# Maintainer: Joris Steyn <jorissteyn@gmail.com>

pkgname=vim-vdebug
pkgver=1.4.1
pkgrel=2
pkgdesc='Multi-language DBGP debugger client for Vim'
arch=('any')
url='https://github.com/joonty/vdebug'
license=('custom')
depends=('vim' 'python')
makedepends=()
source=(
    "https://github.com/joonty/vdebug/archive/v${pkgver}.tar.gz"
    "patch-vim7-4-260-fix-ce92c9f.diff"
)
md5sums=(
    '5c1306620187e578a480cee7c1c7823a'
    '994d45785874a39b32d0433791edbefb'
)
install=vimdoc.install

prepare() {
    cd "$srcdir/vdebug-$pkgver"
    patch -p1 < "$srcdir/patch-vim7-4-260-fix-ce92c9f.diff"
}

package() {
  install -d "${pkgdir}"/usr/share/vim/vimfiles/{"${pkgname}",doc,plugin,syntax}
  install -d "${pkgdir}"/usr/share/vim/vimfiles/plugin/python/vdebug

  install -D -m644 "${srcdir}"/vdebug-${pkgver}/doc/Vdebug.txt \
    "${pkgdir}"/usr/share/vim/vimfiles/doc/

  # just copying all python scripts 
  cp -dr --no-preserve=ownership "${srcdir}"/vdebug-${pkgver}/plugin/python/vdebug/* \
    "${pkgdir}"/usr/share/vim/vimfiles/plugin/python/vdebug/

  install -D -m644 "${srcdir}"/vdebug-${pkgver}/plugin/python/start_vdebug.py \
    "${pkgdir}"/usr/share/vim/vimfiles/plugin/python/

  install -D -m644 "${srcdir}"/vdebug-${pkgver}/plugin/vdebug.vim \
    "${pkgdir}"/usr/share/vim/vimfiles/plugin/vdebug.vim

  install -D -m644 "${srcdir}"/vdebug-${pkgver}/syntax/*.vim \
    "${pkgdir}"/usr/share/vim/vimfiles/syntax/

  install -D -m644 "${srcdir}"/vdebug-${pkgver}/LICENCE \
    "${pkgdir}"/usr/share/vim/vimfiles/${pkgname}/LICENCE
}

