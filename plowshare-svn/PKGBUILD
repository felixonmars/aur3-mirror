# Maintainer: Dan Serban
# Contributor: Manalishi <manalishi at freenet dot de>
# Contributor: Hervé Cauwelier <herve ¤ oursours.net>

pkgname=plowshare-svn
pkgver=latest
pkgrel=1
pkgdesc="A command-line downloader/uploader for file-sharing websites"
arch=(any)
url=http://code.google.com/p/plowshare/
license=(GPLv3)
makedepends=(subversion)
depends=(bash curl imagemagick js recode tesseract)
optdepends=(aview)
provides=(plowshare)
conflicts=(plowshare)

_svnmod=plowshare
_svntrunk=http://plowshare.googlecode.com/svn/trunk

build()
{
  msg "Connecting to SVN repository ..."
  if [ -d "${_svnmod}" ]; then
    cd ${_svnmod} && svn up
    msg2 "SVN repository updated or server timeout."
    cd "${srcdir}"
  else
    svn co ${_svntrunk} ${_svnmod}
    msg2 "SVN checkout done or server timeout."
  fi
  [ -d ${_svnmod}-build ] && rm -r ${_svnmod}-build
  cp -r ${_svnmod} ${_svnmod}-build
}

package()
{
  cd ${_svnmod}-build
  DESTDIR="${pkgdir}" PREFIX=/usr bash setup.sh install
}

