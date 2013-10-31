# Maintainer: Trustin Lee <t at motd.kr>
# Contributor: HazE <hansun.lee at gmail.com>
# Contributor: kaisyu <>
# Contributor: Jazzbug <yeonstyle at gmail.com>

pkgname=pidgin-nateon-git
_pkgname="pidgin-nateon"
pkgver=100.cdf40dd
pkgrel=2
pkgdesc="A pidgin plugin that provides NateOn protocol support"
arch=('i686' 'x86_64')
url="https://github.com/trustin/${_pkgname}"
group=('nateon')
license=('GPL')
depends=('pidgin')
conflicts=("${_pkgname}")
makedepends=("git" "intltool" "libtool" "automake" "autoconf")
source=("git+https://github.com/trustin/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_pkgname}"
  ./autogen.sh return 1
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR=$startdir/pkg/$pkgname install
}

