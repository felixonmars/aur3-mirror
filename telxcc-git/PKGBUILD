# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: Gustavo Alvarez <sl1pkn07 at gmail dot com>
# Contributor: Konstantin Gribov <grossws at gmail dot com>

pkgname=telxcc-git
pkgrel=1
pkgver=v2.5.3.4.gb578cd1
pkgdesc="TELeteXt Closed Captions decoder (produces subtitles in .SRT format from transport stream .TS files) (GIT version)"
arch=('i686' 'x86_64')
url="https://github.com/debackerl/telxcc"
license=('custom:Forers')
conflicts=('telxcc')
provides=('telxcc')
source=('git+https://github.com/petrkutalek/telxcc')
md5sums=('SKIP')
makedepends=('git')
_gitname="telxcc"

pkgver(){
  cd "${_gitname}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  sed 's|sudo||g' -i "${_gitname}"/Makefile
  if test "$CARCH" == x86_64; then
    sed 's|-m64 -march=core2|-m64 -march=x86-64|g' -i "${_gitname}"/Makefile
  fi
  if test "$CARCH" == i686; then
    sed 's|-m64 -march=core2|-m32 -march=i686|g' -i "${_gitname}"/Makefile
  fi
}

build() {
  cd "${_gitname}"
  set CCFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fstack-protector-strong --param=ssp-buffer-size=4"
  make
}

package() {
  cd "${_gitname}"
  install -d "${pkgdir}"/usr/bin
  make DEST="${pkgdir}"/usr install
}