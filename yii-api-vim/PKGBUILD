# Maintainer: Peter A. Shevtsov <pshevtsov@severusweb.ru>
pkgname=yii-api-vim
pkgver=1.1.14
pkgrel=1
pkgdesc="Yii API manual plugin for VIM"
arch=('any')
url="https://github.com/mikehaertl/yii-api-vim"
license=('FDL')
depends=('vim-runtime')
options=('docs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mikehaertl/$pkgname/tarball/v$pkgver")
install='vimdoc.install'
md5sums=('34d08838a85779e337ebd5c97ba30ab7')

package() {
    cd "$srcdir/mikehaertl-$pkgname-2726c64/doc"
    rm tags
    install -d "$pkgdir/usr/share/vim/vimfiles/doc"
    cp -R . "$pkgdir/usr/share/vim/vimfiles/doc"
}

# vim:set ts=2 sw=2 et:
