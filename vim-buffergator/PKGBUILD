# Maintainer: Patrice Peterson <runiq at archlinux dot us>

pkgname=vim-buffergator
pkgver=2.4.1
pkgrel=1
pkgdesc="Buffer listing, selection, and switching/navigation utility for vim"
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=3619"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install='vimdoc.install'
source=("$pkgname-$pkgver.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=22812"
        "LICENSE")
sha256sums=('e1eff3e8033d2ababea086c2e4c90bb9ff5cca268dec174aeebdefc05eddee10'
            'b9af926cb1224a72dd902504df6c8183121731754629a67ac6737a214dbb74c7')

package() {
    cd "$pkgname"
    install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,plugin} || return 1
    install -m644 doc/*.txt ${pkgdir}/usr/share/vim/vimfiles/doc/ || return 1
    install -m644 plugin/*.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/ || return 1
    install -Dm644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

