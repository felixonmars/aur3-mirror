# Maintainer: Czipperz <czipperz@gmail.com>

pkgname=oh-my-zsh-curl
pkgver=1.0
pkgrel=1
pkgdesc="Downloads oh-my-zsh using wget"
arch=('any')
license=('GPL3')
depends=('zsh')
makedepends=('curl')
url="https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh"

package() {
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
}
