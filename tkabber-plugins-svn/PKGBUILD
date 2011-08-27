# Maintainer: h31 <h31mail@yandex.com>

pkgname=tkabber-plugins-svn
pkgver=1833
pkgrel=5
pkgdesc="Official plugins for a Tkabber Jabber client"
arch=(i686 x86_64)
url="http://tkabber.jabber.ru/"
license=("GPL")
depends=('tkabber-svn')
makedepends=('make')
_svntrunk=http://svn.xmpp.ru/repos/tkabber/trunk/tkabber-plugins
_svnmod=tkabber

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  svn export $_svnmod $_svnmod-build
  cd $_svnmod-build

#  mv Makefile Makefile.orig
#  sed 's/xml2rfc/xml2rfc.tcl/g' Makefile.orig > Makefile
  make PREFIX=/usr DESTDIR=${pkgdir} install || return 1

  rm -rf ${srcdir}/$_svnmod-build
}