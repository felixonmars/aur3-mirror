# Maintainer: h31 <h31mail@yandex.com>

pkgname=tkabber-svn
pkgver=1837
pkgrel=4
pkgdesc="Tkabber is an open source Jabber client, written in Tcl/Tk."
arch=(i686 x86_64)
url="http://tkabber.jabber.ru/"
license=("GPL")
depends=('tcl' 'tk' 'bwidget' 'tcllib')
makedepends=('make' 'xml2rfc')
#install=
source=('tkabber-run' 'tkabber.desktop')
_svntrunk=http://svn.xmpp.ru/repos/tkabber/trunk/tkabber
_svnmod=tkabber
provides=('tkabber')
conflicts=('tkabber')
md5sums=('f552a22a3e5ef2c0f32a2092170a5f58'
         '8505282564fc268cdacefd3e259dbb18')

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

  mv Makefile Makefile.orig
  sed 's/xml2rfc/xml2rfc.tcl/g' Makefile.orig > Makefile
  rm Makefile.orig
  make PREFIX=/usr DESTDIR=${pkgdir} install || return 1
  cd ..
  rm ${pkgdir}/usr/bin/tkabber
  cp tkabber-run ${pkgdir}/usr/bin/tkabber
  mkdir -p ${pkgdir}/usr/share/applications/
  cp tkabber.desktop ${pkgdir}/usr/share/applications/

  rm -rf ${srcdir}/$_svnmod-build
}