# Maintainer: PelPix <kylebloss[at]pelpix.info>

pkgname=fdkaac
pkgver=0.5.1
pkgrel=1
pkgdesc="Encoder frontend for libfdk-aac"
arch=('i686' 'x86_64')
url="https://github.com/nu774/fdkaac"
license=('custom')
depends=('libfdk-aac')
provides=('fdkaac')
conflicts=('fdkaac-git')
#source=("git://github.com/nu774/fdkaac.git#tag=v${pkgver}")
source=("http://github.com/nu774/fdkaac/archive/v${pkgver}.tar.gz")
_gitname="fdkaac"
md5sums=('d487c3026280a23ad801b92d52d8c93d')

#pkgver() {

#  cd "${srcdir}/${_gitname}"
  
#  git log -1 --format="%cd" --date=short | sed 's|-||g'
#}

build() {
  cd "${_gitname}-${pkgver}"
  autoreconf -if
  ./configure --prefix=/usr --disable-rpath
  
  make
}

package() {
  cd "${_gitname}-${pkgver}"

  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
