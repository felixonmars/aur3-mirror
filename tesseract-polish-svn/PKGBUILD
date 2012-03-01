# Maintainer: kfgz <kfgz at interia pl>
# Contributor: Jacek Roszkowski <j.roszk at gmail dot com>

pkgname=tesseract-polish-svn
pkgver=35
pkgrel=1
pkgdesc="High quality data files for Polish language support for Tesseract OCR."
arch=(any)
url="http://code.google.com/p/tesseract-polish/"
license=('custom')
makedepends=('subversion')

_svntrunk=http://tesseract-polish.googlecode.com/svn/trunk/tessdata/
_svnmod=tessdata

build() {
  cd "${srcdir}"

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}"/${_svnmod}-build
  cp -r "${srcdir}"/${_svnmod} "${srcdir}"/${_svnmod}-build
}

package() {
  cd "${srcdir}"/${_svnmod}-build

  install -dm755 "${pkgdir}"/usr/share/{tessdata,licenses/tesseract-polish-svn}
  install -m644 pol.* "${pkgdir}"/usr/share/tessdata
  install -m644 {ATTRIBUTIONS,LICENSE,NOTICE} "${pkgdir}"/usr/share/licenses/tesseract-polish-svn
}