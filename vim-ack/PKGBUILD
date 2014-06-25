# Maintainer: Patrice Peterson <runiq at archlinux dot us>
pkgname=vim-ack
pkgver=0.3.1
_scriptid=10433
pkgrel=2
pkgdesc="Plugin for the CLI script/Perl module 'ack'"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2572"
license=('custom:vim')
depends=('vim' 'ack')
install=vimdoc.install
source=($pkgname-$pkgver.tar.gz::"http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}"
        "LICENSE")
sha256sums=('38ba55d0e7843568fcace6cfc04d5fc41d3fb9cc76c7fcf0b4680f0546c66e5c'
            '446c67d93c43addf076fe103a71844c2d875d478f82186436567dd221f2652f3')

package() {
  cd $srcdir

  _installpath="${pkgdir}/usr/share"
  install -Dm644 plugin/ack.vim ${_installpath}/vim/vimfiles/plugin/ack.vim
  install -Dm644 doc/ack.txt ${_installpath}/vim/vimfiles/doc/ack.txt
  install -Dm644 ${srcdir}/LICENSE ${_installpath}/licenses/${pkgname}/license.txt

}

# vim:set ts=2 sw=2 et:
