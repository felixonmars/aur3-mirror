# Maintainer: Czipperz <czipperz@gmail.com>

pkgname=oh-my-zsh-wget
pkgver=1.0
pkgrel=2
pkgdesc="Downloads oh-my-zsh using wget"
arch=('any')
license=('GPL3')
depends=('zsh')
makedepends=('wget')
url="https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh"

package() {
	wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
}
