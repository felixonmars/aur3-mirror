# Contributor: Larry Hajali <larryhaja [at] gmail [dot] com>

pkgname=qwitik
pkgver=0.1.2
pkgrel=1
pkgdesc="Cross-platform client for twitter.com"
arch=('i686' 'x86_64')
url="http://code.google.com/p/qwitik/"
license=('GPL3')
depends=('qt>=4.5.0' 'qtwitlib-svn')
install=(qwitik.install)
source=(http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.src.tar.gz
        ${pkgname}.desktop)
md5sums=('851d7aed9e84f021d49c1ace178f4806'
         'bb876c88af7714314e532aa0e48885ba')

build()
{
  cd $pkgname

  qmake -unix PREFIX=/usr "INCLUDEPATH += /usr/include/qtwitlib" -o Makefile ${pkgname}.pro || return 1
  make \
    CFLAGS="-pipe ${CFLAGS} -Wall -W -D_REENTRANT \$(DEFINES)" \
    CXXFLAGS="-pipe ${CXXFLAGS} -Wall -W -D_REENTRANT \$(DEFINES)" || return 1

  # Install the binary file.
  install -d -m 0755 ${pkgdir}/usr/bin || return 1
  install -m 0755 bin/$pkgname ${pkgdir}/usr/bin || return 1

  # Install the desktop menu item and icons.
  install -d -m 0755 ${pkgdir}/usr/share/applications || return 1
  install -m 0644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications || return 1
  for _pic in 16 32 64; do
    install -D -m 0644 images/${pkgname}${_pic}.png \
      ${pkgdir}/usr/share/icons/hicolor/${_pic}x${_pic}/apps/${pkgname}.png
  done
}
