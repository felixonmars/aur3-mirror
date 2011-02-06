#Maintainer: ahmad200512<@>yandex.ru
pkgname=falcon-vim
pkgver=1
pkgrel=1
pkgdesc="Vim support for Falcon programming language"
url="http://www.falconpl.org/"
arch=('any')
license=('custom:vim')
depends=('vim')
source=('http://www.falconpl.org/project_dl/highlights/Falcon_vim.zip')
md5sums=('2ac9bced575572a9cd733e9574ef044a')
install=('falcon.install')

build() {
	install -Dm644 "$srcdir"/ftdetect/falcon.vim "$pkgdir/usr/share/vim/vim73/ftdetect/falcon.vim"
	install -Dm644 "$srcdir"/ftplugin/falcon.vim "$pkgdir/usr/share/vim/vim73/ftplugin/falcon.vim"
	install -Dm644 "$srcdir"/indent/falcon.vim "$pkgdir/usr/share/vim/vim73/indent/falcon.vim"
	install -Dm644 "$srcdir"/syntax/falcon.vim "$pkgdir/usr/share/vim/vim73/syntax/falcon.vim"
}
