pkgname=schat-svn
pkgver=1446
pkgrel=1
pkgdesc="IMPOMEZIA Simple Chat — is a simple cross-platform client-server chat for local networks and the Internet with the possibility of individual settings for a specific network, with open source code, written in Qt/C++."
arch=('i686' 'x86_64')
url="http://code.google.com/p/schat/"
license=('GPL3')
depends=('qt')
makedepends=('qt')
provides=('schat')
conflicts=('schat')
source=(schat.desktop)
md5sums=('a5a91d19b548e3dffd8c334162fb4460')

_svnmod="schat"
_svntrunk="http://schat.googlecode.com/svn/branches/0.8/"

build() {

cd ${srcdir}

msg "Connecting to SVN server...."

if [ -d ${_svnmod}/.svn ]; then
(cd ${_svnmod} && svn up -r $pkgver)
else
svn co ${_svntrunk} --config-dir ./ -r $pkgver ${_svnmod}
fi

msg "SVN checkout done or server timeout"
msg "Starting make..."

 rm -rf ${srcdir}/${_svnmod}-build
svn export ${_svnmod} ${_svnmod}-build
cd ${_svnmod}-build

  qmake || return 1
  make || return 1
  install -d -m 755 ${pkgdir}/usr/bin/
  install -d -m 755 ${pkgdir}/usr/share/schat
  cp -R  data/* ${pkgdir}/usr/share/schat/
  install -D -m 644 ${srcdir}/schat.desktop ${pkgdir}/usr/share/applications/schat.desktop
  install -m 755 out/release/* ${pkgdir}/usr/bin/
  rm -rf ${srcdir}/${_svnmod}-build
}