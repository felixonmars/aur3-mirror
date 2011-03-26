# Contributor:  <mathieui@mathieui.net>
pkgname=ludimagia-svn
pkgver=210
pkgrel=1
pkgdesc='Ludimagia is a free MagicWorkStation clone (svn version)'
arch="any"
url="http://codingteam.net/project/ludimagia"
license='GPL'
provides='ludimagia'
depends=('python-pygame' 'pgu' 'xmpppy' 'python-dnspython')
makedepends=('subversion')
_svnmod="ludimagia"
_svntrunk="http://svn.codingteam.net/ludimagia"
build() {
  cd "${srcdir}"
  msg "Connecting to server...."
  svn co $_svntrunk
  msg "SVN checkout done or server timeout"
  cd "${srcdir}/${_svnmod}/"
  mkdir -p "$pkgdir/usr/share/applications/"
  mkdir -p "$pkgdir/usr/share/pixmaps/"
  mkdir -p "$pkgdir/usr/bin"
  make install prefix=$pkgdir/usr
}
