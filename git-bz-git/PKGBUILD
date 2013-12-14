# Maintainer: Techlive Zheng <techlivezheng@gmail.com>

pkgname=git-bz-git
_pkgname=git-bz
pkgver=r135.5ae7a50
pkgrel=1
pkgdesc="Bugzilla subcommand for Git"
arch=('any')
url="http://blog.fishsoup.net/2008/11/16/git-bz-bugzilla-subcommand-for-git/"
license=('GPL2')
depends=('git' 'python2')
makedepends=('git' 'xmlto'  'asciidoc')
source=('git://git.fishsoup.net/git-bz')
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  sed -i 's/python/python2/' git-bz
}
build() {
  cd "${_pkgname}"

  ./configure --prefix=/usr

  make
}

package() {
  cd "${_pkgname}"

  make DESTDIR="${pkgdir}" install
}
