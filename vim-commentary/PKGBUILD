pkgname=vim-commentary
pkgver=1.2
pkgrel=1
pkgdesc="Comment stuff out"
arch=('any')
url="https://github.com/tpope/vim-commentary"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim>=7.0')
install=vimdoc.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/tpope/vim-commentary/archive/v${pkgver}.tar.gz"
        LICENSE)
sha1sums=('fa54844635fef0334a2e428499eda166caf356b5'
          'be741035a33a75861fa14fcbd634d4174912c540')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	installpath="${pkgdir}/usr/share/vim/vimfiles"

	install -Dm644 doc/commentary.txt $installpath/doc/commentary.txt
	install -Dm644 plugin/commentary.vim $installpath/plugin/commentary.vim
	install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
