# Maintainer: Josef Soentgen <jsoentgen@gmail.com>

pkgname=clarity-git
pkgver=20120227
pkgrel=1
pkgdesc="An open-source deconvolution library (git version)"
arch=('i686' 'x86_64')
url="http://cismm.cs.unc.edu/resources/software-manuals/clarity-deconvolution-library/"
license=('GPL2')

makedepends=('git' 'cmake' 'fftw')
depends=('fftw')
provides=("clarity=${pkgver}-${pkgrel}")
conflicts=('clarity')

_gitroot=https://github.com/cquammen/Clarity.git
_gitname=clarity

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."


  rm -rf "${srcdir}/${_gitname}-build"
  cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  mkdir -p "${srcdir}/${_gitname}-build/build"
  cd "${srcdir}/${_gitname}-build/build"

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make

}
package() {
	cd "${srcdir}/${_gitname}-build/build"

	make DESTDIR=${pkgdir} install

	mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/html"
	cp ../docs/html/* "${pkgdir}/usr/share/doc/${pkgname}/html"

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp ../licenses/* "${pkgdir}/usr/share/licenses/${pkgname}"

	install -D -m644 Clarity.h "${pkgdir}/usr/include/Clarity.h"
}
