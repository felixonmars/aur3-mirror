# Maintainer: Daniel Ziltener <zilti@lyrion.ch>

pkgname=vim-clojure
pkgver=2.3.6
pkgrel=2
pkgdesc="vim plugin for Clojure with repl in a buffer, omni completion, docstring lookup"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2501"
license=('custom')
depends=(vim clojure)
groups=('vim-plugins')
install=vimclojure.install
_scriptid=18485
source=(${pkgname}-${pkgver}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        ng-client-2.3.5.zip::http://kotka.de/projects/vimclojure/vimclojure-nailgun-client-2.3.5.zip
        ng-server-${pkgver}.jar::http://clojars.org/repo/vimclojure/server/${pkgver}/server-${pkgver}.jar)
md5sums=('c153b0ddb38cb00acee5aa576ee99aa9'
         '55ed1b8d11e58ccc469f1e23010aa33e'
         '2cdba432169fcf965f1bbb71725d0331')

build() {
    (cd ${srcdir}/vimclojure-nailgun-client && make) || exit 1
}

package() {
    install -m 644 -D $srcdir/autoload/vimclojure.vim $pkgdir/usr/share/vim/vimfiles/autoload/vimclojure.vim
    install -m 644 -D $srcdir/autoload/vimclojure/util.vim $pkgdir/usr/share/vim/vimfiles/autoload/vimclojure/util.vim
    install -m 644 -D $srcdir/doc/clojure.txt $pkgdir/usr/share/vim/vimfiles/doc/clojure.txt
    install -m 644 -D $srcdir/ftdetect/clojure.vim $pkgdir/usr/share/vim/vimfiles/ftdetect/clojure.vim
    install -m 644 -D $srcdir/ftplugin/clojure.vim $pkgdir/usr/share/vim/vimfiles/ftplugin/clojure.vim
    install -m 755 -d $pkgdir/usr/share/vim/vimfiles/ftplugin/clojure
    install -m 644 -D $srcdir/ftplugin/clojure/* $pkgdir/usr/share/vim/vimfiles/ftplugin/clojure/
    install -m 644 -D $srcdir/indent/clojure.vim $pkgdir/usr/share/vim/vimfiles/indent/clojure.vim
    install -m 644 -D $srcdir/plugin/clojure.vim $pkgdir/usr/share/vim/vimfiles/plugin/clojure.vim
    install -m 644 -D $srcdir/syntax/clojure.vim $pkgdir/usr/share/vim/vimfiles/syntax/clojure.vim

    install -m 755 -D ${srcdir}/vimclojure-nailgun-client/ng ${pkgdir}/usr/bin/ng
    install -m 644 -D ${srcdir}/ng-server-2.3.6.jar ${pkgdir}/usr/share/${pkgname}/vimclojure.jar
    install -m 644 -D ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
