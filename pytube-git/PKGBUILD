# Author: Nick Ficano
# Maintainer: Chubby_Lover <chubbyloverb@gmail.com>
pkgname='pytube-git'
_gitname="pytube"
pkgver=70.f6e4c8e
pkgrel=2
pkgdesc="Python library for downloading youtube videos."
arch=('any')
url="https://github.com/NFicano/pytube"
license=('MIT')
depends=('python2')
makedepends=('git')
provides=('pytube')
conflicts=('pytube')
source=("git://github.com/NFicano/pytube.git")
md5sums=('SKIP') #generate with 'makepkg -g'

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "${srcdir}/${_gitname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}




# vim:set ts=2 sw=2 et:
