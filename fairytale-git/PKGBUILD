# Maintainer: greygjhart <greg+devel@marvid.fr>
pkgname=fairytale-git
_gitname=fairytale
pkgver=20131104
pkgrel=1
pkgdesc="A set of tools to manage your system's fairies."
url="http://github.com/greygjhart/${_gitname}"
arch=("any")
license=("GPLv3")
depends=("dbus-core" "shadow")
makedepends=("git" "gettext" "gzip")
source=("git://github.com/greygjhart/fairytale.git")
md5sums=('SKIP')
install="fairytale.install"

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
