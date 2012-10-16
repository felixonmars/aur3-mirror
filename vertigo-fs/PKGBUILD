# Maintainer: Martynas Januskauskas <martynas@januskauskas.eu>
pkgname=vertigo-fs
_pkgname=vertigo
pkgver=0.26
pkgrel=2
pkgdesc="A flight simulator that focuses on realism of the flight model"
arch=('i686' 'x86_64')
url="http://stjerneskud.info/vertigo/"
license=('GPL')
depends=('allegro4' 'cgui')
makedepends=('sox' 'unzip')
source=("http://stjerneskud.info/vertigo/src026.zip"
        "${_pkgname}.patch"
        "${_pkgname}-fix_paths.patch"
        "${_pkgname}-makedefs.patch")
noextract=("src026.zip")
md5sums=('4f09149ef1b6f57fd09e07dcc13dfc78'
         'a52298397f0dcc7ee64637dce914f4d8'
         '949fc51bc0be948a0b5c0312a98cfdd6'
         '62cc8abb26a09e506206d915ec8dbde9')

build() {
  cd "${srcdir}"

  # Unzip the archive
  unzip -La src026.zip

  # Compile
  cd "${_pkgname}"
  patch -Np0 -i "../${_pkgname}.patch"
  patch -Np0 -i "../${_pkgname}-fix_paths.patch"
  patch -Np0 -i "../${_pkgname}-makedefs.patch"
  make || return 1

  # Fix the corrupted wav-file
  sox sound/talk/n2.wav sound/talk/n2.wav

  # Workaround for the error when reading float values
  sed -i "s/\.0//g" objects/objects.pos
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install binary
  install -Dm755 "X${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # Install data files
  mkdir -p "${pkgdir}/usr/share/${_pkgname}/objects"
  cp -r sound "${pkgdir}/usr/share/${_pkgname}"
  install -m644 objects/objects.{dat,pos} "${pkgdir}/usr/share/${_pkgname}/objects"
  install -m644 *.dat "${pkgdir}/usr/share/${_pkgname}"

  # Install docs
  mkdir -p "${pkgdir}/usr/share/doc/${_pkgname}"
  install -m644 {keys,vertigo}.txt *.htm "${pkgdir}/usr/share/doc/${_pkgname}"
}
