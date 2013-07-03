# Maintainer: modywzm <modywzm at gmail dot com>#
pkgname=neap-svn
pkgver=78
pkgrel=1
pkgdesc="A simple pager that runs in the notification area / systray of your panel."
arch=('i686' 'x86_64')
url="http://code.google.com/p/neap/"
license=('custom:BSD-new')
depends=('python2' 'pygtk' 'python2-xlib')
makedepends=('subversion')
provides=('neap')
conflicts=('neap')
install="$pkgname.install"

_svnmod="neap"
_svntrunk="http://neap.googlecode.com/svn/trunk/"

package() {
  cd ${srcdir}

  #####
  msg "Getting sources..."
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
    cd ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  #####

  cd ${srcdir}/${_svnmod}
  install -D -m 644 License.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -D -m 755 neap ${pkgdir}/usr/bin/neap
}
