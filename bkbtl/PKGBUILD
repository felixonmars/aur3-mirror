# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=bkbtl
pkgver=beta8
pkgrel=2
pkgdesc="An emulator of the BK-0010/0011 computers"
arch=('i686' 'x86_64')
url="http://code.google.com/p/bkbtl/"
license=('LGPL')
depends=('qt')
makedepends=('subversion')
source=("${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('631ba1510ba4ba08c4e7a10217928467'
         'ee080ae7b2c14a17015b117c7bd7c23d')

build() {
  cd "${srcdir}"

  _svntrunk="http://bkbtl.googlecode.com/svn/trunk/src/QtBkBtl"
  _svnroms="http://bkbtl.googlecode.com/svn/trunk/lib/roms"
  _svnrev=131
  _svnmod="bkbtl-read-only"

  # Download source code from SVN
  if [[ ! -d ${_svnmod} ]]; then
    svn co ${_svntrunk} -r ${_svnrev} ${_svnmod}
  fi

  # Download ROM files from SVN
  if [[ ! -d roms ]]; then
    svn co ${_svnroms}
  fi

  rm -rf ${_svnmod}-build
  cp -r ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build

  # Set path to ROM files
  sed -i "s|= _T(\"|&/usr/share/${pkgname}/|" Emulator.cpp

  # Compile
  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname}-read-only-build"

  # Install program files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  install -m644 ../roms/*.rom "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 QtBkBtl "${pkgdir}/usr/bin/${pkgname}"

  # Install a desktop entry
  install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
