# Contributor: Kamil Stachowski <kamil.stachowski@gmail.com>

pkgname=vimacs
pkgver=0.95
pkgrel=1
pkgdesc="Vim-improved eMACS brings Emacs's key bindings and modeless editing to Vim, while retaining Vim's moded editing style"
url="http://www.algorithm.com.au/code/vimacs"
arch=('i686' 'x86_64')
license=('GPL')
depends=('vim')
groups=('vim-plugins')
provides=('vimacs')
conflicts=()
replaces=()
source=("http://www.algorithm.com.au/downloads/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('d31a94c7519970c47e21edb5c8380fac')

package() {
	mkdir -p "$pkgdir/usr/share/vim/vimfiles/doc"
	install -m644 "$srcdir/$pkgname-$pkgver/doc/tab-indent.txt" "$pkgdir/usr/share/vim/vimfiles/doc/tab-indent.txt"
	install -m644 "$srcdir/$pkgname-$pkgver/doc/vimacs.txt" "$pkgdir/usr/share/vim/vimfiles/doc/vimacs.txt"
	mkdir -p "$pkgdir/usr/share/vim/vimfiles/plugin"
	install -m644 "$srcdir/$pkgname-$pkgver/plugin/tab-indent.vim" "$pkgdir/usr/share/vim/vimfiles/plugin/tab-indent.vim"
	install -m644 "$srcdir/$pkgname-$pkgver/plugin/$pkgname-$pkgver.vim" "$pkgdir/usr/share/vim/vimfiles/plugin/$pkgname-$pkgver.vim"
}
