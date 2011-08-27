# Maintainer: Daniel Riedemann <daniel.riedemann [at] googlemail [dot] com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kopete-svn
pkgver=1217717
pkgrel=1
pkgdesc="Instant Messenger"
arch=('i686' 'x86_64')
url="http://kde.org/applications/internet/kopete/"
license=('GPL')
depends=('kdebase-runtime' 'kdepimlibs' 'qca-ossl' 'libotr' 'libmsn'
	 'libidn' 'qimageblitz' 'v4l-utils' 'libgadu')
makedepends=('subversion')
provides=('kdenetwork-kopete')
conflicts=('kdenetwork-kopete')

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdenetwork/kopete
_svnmod=kopete

build() {
  cd "${srcdir}"

  if [[ -d ${_svnmod}/.svn ]]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  [[ -d "${srcdir}/${_svnmod}-build" ]] && rm -rf "${srcdir}/${_svnmod}-build"
  cp -r "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  cmake -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_SKIP_RPATH=ON \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DMOZPLUGIN_INSTALL_DIR=/usr/lib/mozilla/plugins/ \
	-DWITH_Xmms=OFF \
	-DWITH_LibMeanwhile=OFF

  make DESTDIR=${pkgdir} install
}
