# Maintainer: Antonio Bonifati <http://ninuzzo.github.com>
# Contributor: M Rawash <mrawash@gmail.com>
# Contributor: David Campbell <davekong@archlinux.us>
# Contributor: cap_sensitive (cap.sensitive@gmail.com)
# Contributor: Laszlo Papp

pkgname=vim-slimv
pkgver=0.9.12
pkgrel=1
_src_id=21253
pkgdesc="Lisp and Clojure REPL inside Vim with profiling and Hyperspec lookup, like SLIME"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2531"
license=('custom')
# You can change gvim to vim-inteprete if you do not want GUI support.
depends=('vim' 'python2')
optdepends=('gvim: for the slimv menu')
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}-${pkgver}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_src_id}
        license.txt)
md5sums=('a608355dc71db3f27c040428a836e6e3'
         'efbd5986e691ce8c876fb86e8f5961ea')
build() {
    cd "$srcdir"
    sed -i 's/\/usr\/bin\/env python)/\/usr\/bin\/env python2/g' ./ftplugin/swank.py
    install -d $pkgdir/usr/share/vim/vimfiles/{doc,ftdetect,syntax,indent,ftplugin}
    install -D doc/* $pkgdir/usr/share/vim/vimfiles/doc
    install -D ftdetect/* $pkgdir/usr/share/vim/vimfiles/ftdetect
    install -Dm644 plugin/paredit.vim $pkgdir/usr/share/vim/vimfiles/plugin/paredit.vim
    cp -r {ftplugin,indent,syntax} $pkgdir/usr/share/vim/vimfiles
    install -d $pkgdir/usr/share/common-lisp/source
    cp -r slime $pkgdir/usr/share/common-lisp/source
    install -D license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}
# vim:set ts=2 sw=2 et:
