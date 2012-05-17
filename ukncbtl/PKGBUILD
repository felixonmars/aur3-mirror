# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=ukncbtl
pkgver=beta24
pkgrel=2
pkgdesc="An emulator of the MS-0511 (UKNC) computers"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ukncbtl/"
license=('LGPL')
depends=('qt')
makedepends=('subversion')
source=("http://ukncbtl.googlecode.com/svn/trunk/src/UKNCBTL.Qt/uknc_rom.bin"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('28d4c0de3f08554ae4f8d54f1aad22f4'
         'e5bdc85b256738707e2f4016cd3f7aa2'
         'bec424d13415f526cadb3aa121f4c3b7')

build() {
  cd "${srcdir}"

  _svntrunk="http://ukncbtl.googlecode.com/svn/trunk/src/UKNCBTL.Qt"
  _svnrev=338
  _svnmod="ukncbtl-read-only"

  # Download source code from SVN
  if [[ ! -d ${_svnmod} ]]; then
    svn co ${_svntrunk} -r ${_svnrev} ${_svnmod}
  fi

  rm -rf ${_svnmod}-build
  cp -r ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build

  # Set path to the ROM file
  sed -i "s|uknc_rom.bin|/usr/share/${pkgname}/&|" Emulator.cpp

  # Compile
  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname}-read-only-build"

  # Install program files
  install -Dm644 ../uknc_rom.bin "${pkgdir}/usr/share/${pkgname}/uknc_rom.bin"
  install -Dm755 QtUkncBtl "${pkgdir}/usr/bin/${pkgname}"

  # Install a desktop entry
  install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
