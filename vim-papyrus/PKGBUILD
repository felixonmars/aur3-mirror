# Maintainer: Ixen <fairyknight -at- runbox -dot- com>


pkgname=vim-papyrus
pkgver=1
pkgrel=1
pkgdesc="Vim syntax highlighting for the Papyrus scripting language used in TES5: Skyrim"
arch=('any')
url="https://github.com/sirtaj/vim-papyrus"
license=('custom')
depends=('vim')
makedepends=('git')
_gitroot='git://github.com/sirtaj/vim-papyrus'
_gitname='vim-papyrus'

package() {
	git clone $_gitroot $_gitname
	cd ${srcdir}/vim-papyrus
	sed -n '/License/,/ to do so./p' README.md > LICENSE
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE

	install -Dm644 syntax/papyrus.vim ${pkgdir}/usr/share/vim/vim74/syntax/papyrus.vim
	install -Dm644 ftdetect/papyrus.vim ${pkgdir}/usr/share/vim/vim74/ftdetect/papyrus.vim
	install -Dm644 ftplugin/papyrus.vim ${pkgdir}/usr/share/vim/vim74/ftplugin/papyrus.vim
	install -Dm644 compiler/papyrus.vim ${pkgdir}/usr/share/vim/vim74/compiler/papyrus.vim
}
