# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=quvi-git
pkgver=v0.9.4.7.g5e2675a
pkgrel=1
pkgdesc="Command line tool for parsing flash media stream URLs. (GIT version)"
arch=('i686' 'x86_64')
url="http://quvi.sourceforge.net/"
license=('ADPL3')
depends=('libquvi-git')
makedepends=('git')
options=('!libtool')
provides=('quvi')
conflicts=('quvi')
source=('quvi::git://repo.or.cz/quvi-tool.git#branch=next')
_gitname="quvi"
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo "$(git describe --always | tr - .)"
}

build() {
  cd "${_gitname}"

  ./bootstrap.sh

  ./configure --prefix=/usr

  make
}

package() {
  cd "${_gitname}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/license"
}

# vim: ft=sh syn=sh sw=2 ts=2 et
