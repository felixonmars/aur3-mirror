# Maintainer: vitamin.caig@gmail.com
pkgname=textator-svn
pkgver=89
pkgrel=1
pkgdesc="Utility for text processing while software developing"
arch=('i686' 'x86_64')
url="http://textator.googlecode.com"
license=('GPL3')
makedepends=('subversion')
provides=('textator')
options=(!strip !docs !libtool !emptydirs !zipman makeflags)
_svntrunk="http://textator.googlecode.com/svn/trunk"
_svnmod="textator"
_options="mode=release platform=linux"

build() {
  cd "${srcdir}"
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi
  msg "SVN checkout done or server timeout"

  msg "Starting make"
  rm -rf "${srcdir}/${_svnmod}-build"
  svn export "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"
  make ${_options} definitions=TEXTATOR_VERSION=rev${pkgver} -C src
}

package() {
  cd "${srcdir}/${_svnmod}-build"
  make DESTDIR="${pkgdir}" ${_options} install -C src
}
