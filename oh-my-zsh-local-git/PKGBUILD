# Maintainer: Czipperz <czipperz@gmail.com>

pkgname=oh-my-zsh-local-git
pkgver=1.0
pkgrel=2
pkgdesc="Downloads oh-my-zsh from git and installs it in the local directory"
arch=('any')
license=('GPL3')
depends=('zsh')
makedepends=('git')
url="https://github.com/robbyrussell/oh-my-zsh"
source=('git://github.com/robbyrussell/oh-my-zsh.git')

package() {
	install -Dm644 $HOME/.zshrc $srcdir$HOME/.zshrc.orig
	cp -R oh-my-zsh $srcdir$HOME/.oh-my-zsh
	cd $srcdir$HOME
	cp .oh-my-zsh/templates/zshrc.zsh-template .zshrc
	echo "Changing default shell for you:"
	chsh -s $(which zsh)
}
md5sums=('SKIP')
