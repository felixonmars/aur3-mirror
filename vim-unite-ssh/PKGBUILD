pkgname=vim-unite-ssh
pkgver=1.0
_gitcommit=b26e177
pkgrel=1
pkgdesc="Unite source for ssh"
arch=('any')
url="https://github.com/Shougo/unite-ssh"
license=('MIT')
depends=('vim-unite' 'vim-vimproc' 'openssh')
optdepends=('vim-vimfiler: for easier file browsing and editing')
groups=('vim-plugins')
install=vimdoc.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/Shougo/unite-ssh/tarball/$_gitcommit")
sha1sums=('af9b7bea0fdaa7251aed99b66d49485676d811f4')

package() {
	cd "$srcdir/Shougo-unite-ssh-$_gitcommit"

	installpath="${pkgdir}/usr/share/vim/vimfiles"

	install -d $installpath/autoload/unite/{kinds,sources}
	install -Dm644 autoload/unite/kinds/* $installpath/autoload/unite/kinds/
	install -Dm644 autoload/unite/sources/* $installpath/autoload/unite/sources/
	install -Dm644 doc/unite-ssh.txt $installpath/doc/unite-ssh.txt
}
