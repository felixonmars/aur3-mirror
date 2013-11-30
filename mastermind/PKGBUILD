# Maintainer:  Omid Nikta <omidnikta@gmail.com>
# Contributor: Omid Nikta <omidnikta@gmail.com>
 
pkgname=mastermind
pkgver=0.4
pkgrel=1
pkgdesc="A Code-Breaking Game With Built-in Solver. Included Solving Algorithms: Most Parts, Worst Case, Expected Size."
arch=('i686' 'x86_64')
url="http://omidnikta.github.io/mastermind/"
license=('GPL3')
depends=('qt4')
makedepends=('git')
provides=('mastermind')
install=mastermind.install
url="http://omidnikta.github.io/mastermind/"
_gitroot="https://github.com/omidnikta/mastermind"
_gitname="mastermind"
 

build() {
	cd $srcdir
	
	msg "Connecting to the GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  
  msg "Starting make..."

  if [ -d ${srcdir}/${_gitname}-build ]; then
      rm -rf ${srcdir}/${_gitname}-build
  fi

  cp -r ${srcdir}/$_gitname ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build

  export KDE="true"
   
  qmake-qt4
  make clean
  make
}
 
package() {
  cd ${srcdir}/${pkgname}-build
 
  # binary
  install -D -m755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # documentation & manual
  install -d ${pkgdir}/usr/share/${pkgname}
#  install -d ${pkgdir}/usr/share/${pkgname}/translations
  cp -r translations/ ${pkgdir}/usr/share/${pkgname}/

  # icon
  install -D -m644 icons/hicolor/512x512/mastermind.png \
    ${pkgdir}/usr/share/pixmaps/mastermind.png

  # desktop
  install -D -m644 ${pkgname}.desktop \
    ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
 
# vim: set ft=sh ts=2 sw=2 et:
