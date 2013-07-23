# Maintainer:  Omid Nikta <omidnikta@gmail.com>
# Contributor: Omid Nikta <omidnikta@gmail.com>

pkgname=kla
pkgver=20130723
pkgrel=1
pkgdesc="A Keyboard Layout Analyzer."
arch=('i686' 'x86_64')
url="https://github.com/mehdioa/kla"
license=('GPL3')
depends=('qt4' 'git')
provides=('kla')
install=kla.install
_gitroot="https://github.com/mehdioa/kla"
_gitname="master"
_rev="Initial commit"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $pkgname ] ; then
    cd $pkgname && git pull origin && cd ..
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
 
 cd $pkgname

  msg "GIT checkout done or server timeout"
  msg "Starting qmake..."

  qmake-qt4
  make || return 1

} 
 
package() {
  cd ${srcdir}/$pkgname
 
  # binary
  install -D -m755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # documentation & manual
  install -d ${pkgdir}/usr/share/doc/${pkgname}
  install -d ${pkgdir}/usr/share/doc/${pkgname}/Layouts
  cp -r Manual/README.pdf ${pkgdir}/usr/share/doc/${pkgname}
  cp -r Layouts/ ${pkgdir}/usr/share/doc/${pkgname}/

  # icon
  install -D -m644 Images/kla.png \
    ${pkgdir}/usr/share/pixmaps/kla.png

  # desktop
  install -D -m644 ${pkgname}.desktop \
    ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
 