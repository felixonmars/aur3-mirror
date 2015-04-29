# Maintainer: Michael Smith (spinda) <michael@diglumi.com>

_pkgname=nemo-owncloud
pkgname=${_pkgname}-git
pkgver=1.0.0
pkgrel=1
pkgdesc="ownCloud plugin for the Nemo file manager"
arch=('any')
url="https://github.com/spinda/nemo-owncloud"
license=('GPL')
depends=('nemo' 'python3' 'nemo-python' 'owncloud-client')

install="${_pkgname}.install"

_gitroot=git+https://github.com/spinda/nemo-owncloud.git
_gitname=nemo-owncloud

source=("$_gitroot" "${_pkgname}.install")
sha256sums=('SKIP' '7b3a40598065b153fe95ac2f9bb31566750b6e3da8e3963a701c2a1de1df8a05')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cp -r "$srcdir/$_gitname/usr" "${pkgdir}"
}

