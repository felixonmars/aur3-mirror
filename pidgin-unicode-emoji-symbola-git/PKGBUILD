# Maintainer: /dev/rs0 <rs0@secretco.de.com>

_gitname="stv0g"
_pkgname="unicode-emoji"

pkgname="pidgin-${_pkgname}-symbola-git"
pkgver=r23.25ea4a9
pkgrel=1
pkgdesc="Standard (Symbola) Unicode Emojis for Pidgin."
arch=('any')
url="https://github.com/${_gitname}/${_pkgname}"
license=('Apache')
depends=('pidgin')
makedepends=('git')
provides=("pidgin-${_pkgname}-symbola")
conflicts=("pidgin-${_pkgname}-git")
source=("git+https://github.com/${_gitname}/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    installdir="$pkgdir/usr/share/pixmaps/pidgin/emotes"    
    install -d "$installdir"
    cp -r symbola "$installdir"
}
