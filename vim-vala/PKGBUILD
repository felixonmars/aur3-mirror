# Maintainer: Ryan Zabcik ryanzabcik@gmail.com
pkgname=vim-vala
pkgver=20120219
pkgrel=1
pkgdesc="Vim syntax hilighting for Vala"
arch=(any)
url="https://wiki.gnome.org/Projects/Vala/Vim"
license=('GPL')
depends=(vim vala)
source=('https://wiki.gnome.org/Projects/Vala/Vim?action=AttachFile&do=get&target=vala.vim' 'ftdetect.vim')
md5sums=('807ea0ee696bdadc2f6466f9d3ad4d5b'
         '53e0e036cb08880c58491752ed253b48')

package() {
    vimfiles="$pkgdir/usr/share/vim/vimfiles"
    install -Dv "Vim?action=AttachFile&do=get&target=vala.vim" \
        "$vimfiles/syntax/vala.vim"
    install -Dv "ftdetect.vim" "$vimfiles/ftdetect/vala.vim"
}
