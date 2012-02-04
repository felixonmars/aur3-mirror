# Contributor: Thriller <farreva232@yandex.ru>

pkgname=freqbot-svn
pkgver=361
pkgrel=1
pkgdesc="An XMPP (Jabber) bot"
url="http://developer.berlios.de/projects/freq-dev/"
arch=('any')
license=('GPL')
depends=('python2' 'python-pysqlite' 'twisted')
makedepends=('subversion' 'make')
conflicts=()
provides=('')
install=freqbot-svn.install

source=()
md5sums=()

_svntrunk=svn://svn.berlios.de/freq-dev/trunk
_svnmod=freq-dev

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  patch Makefile.in ${startdir}/reminst.diff
  ./configure prefix=/usr sysconfdir=/etc
  make || return 1
  make instdir=${pkgdir} install || return 1
  mkdir -p ${pkgdir}/etc/rc.d
  cp ${startdir}/freqbot.rc ${pkgdir}/etc/rc.d/freqbot && chmod +x ${pkgdir}/etc/rc.d/freqbot

  rm -rf ${srcdir}/$_svnmod-build
}

