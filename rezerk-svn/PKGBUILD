# Maintainer: Dany Martineau <dany.luc.martineau at gmail.com>

pkgname=rezerk-svn
pkgver=161
pkgrel=1
pkgdesc="Sequel to the classic arcade game, Berzerk."
arch=('i686' 'x86_64')
url="http://www.averagesoftware.org/index.php?page=rezerk"
license=('GPL3')
depends=('openal' 'gtkglext' 'libvorbis')
makedepends=('make')
source=(rezerk.desktop)
md5sums=('f36e9f50e861afcdbe774363654e41ba')

_svntrunk=svn://averagesoftware-uniserver.no-ip.org/svn/rezerk
_svnmod=rezerk

build() {
  cd ${srcdir}

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn revert -R .)
    (cd ${_svnmod} && svn -r ${pkgver} up)
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}/${_svnmod}/linux
  make
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/{applications,rezerk/game}
  mkdir -p ${pkgdir}/usr/share/rezerk/game/ui
  mkdir -p ${pkgdir}/usr/share/rezerk/{sounds,graphics}
  install  ui/* ${pkgdir}/usr/share/rezerk/game/ui
  install -m 755 rezerk ${pkgdir}/usr/share/rezerk/game
  cd ..
  install  sounds/* ${pkgdir}/usr/share/rezerk/sounds
  cp -R graphics/* ${pkgdir}/usr/share/rezerk/graphics
  install {manual.html,License.txt} ${pkgdir}/usr/share/rezerk/
  install -m 755 ${srcdir}/rezerk.desktop ${pkgdir}/usr/share/applications
  echo "cd '/usr/share/rezerk/game' && ./rezerk" > ${pkgdir}/usr/bin/rezerk.sh
  chmod 755 ${pkgdir}/usr/bin/rezerk.sh
}
