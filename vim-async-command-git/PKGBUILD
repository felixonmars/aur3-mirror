pkgname=vim-async-command-git
pkgver=4.0.r15.g4db91ca
pkgrel=1
pkgdesc="AsyncCommand for vim"
arch=('any')
url="https://github.com/pydave/AsyncCommand"
license=('WTFPLv2')
groups=('vim-plugins')
depends=('vim-runtime')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=vimdoc.install
noextract=()
source=($pkgname::"git+https://github.com/pydave/AsyncCommand.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p $pkgdir/usr/share/vim/vimfiles/{plugin,doc,autoload}
	cp plugin/asynccommand.vim $pkgdir/usr/share/vim/vimfiles/plugin/
	cp doc/asynccommand.txt $pkgdir/usr/share/vim/vimfiles/doc/
	cp autoload/asynccommand.vim $pkgdir/usr/share/vim/vimfiles/autoload/
	cp autoload/asynchandler.vim $pkgdir/usr/share/vim/vimfiles/autoload/
}
