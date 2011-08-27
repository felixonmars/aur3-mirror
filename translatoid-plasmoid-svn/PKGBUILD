# Contributor: Timur Antipin < kosmocap (at) gmail.com >

pkgname=translatoid-plasmoid-svn
pkgver=1082826
pkgrel=2
pkgdesc="A translator plasmoid using google translator"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/translatoid?content=97511"
license=('LGPL')
depends=('kdelibs' 'qjson>=0.5')
makedepends=('cmake' 'automoc4')

_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/playground/base/plasma/applets/translatoid"
_svnmod="translatoid"

build() {
  cd "${srcdir}"
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"

  cp -rf $_svnmod $_svnmod-build || return 1
  cd $_svnmod-build || return 1

  cmake -DCMAKE_INSTALL_PREFIX=/usr ./ || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  rm -rf "${pkgdir}/usr/share/apps/cmake"

  rm -rf "${srcdir}/${_svnmod}-build"
}
