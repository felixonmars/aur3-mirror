# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Carol Alexandru <shapeshifter at archlinux dot us>
pkgname=cherrypy-svn
pkgver=2567
pkgrel=1
pkgdesc="A pythonic, object-oriented web development framework; svn version"
arch=('i686' 'x86_64')
url="http://www.cherrypy.org"
license=('BSD')
depends=('python')
makedepends=('subversion')
provides=('cherrypy')
conflicts=('cherrypy')
#~ source=('license')

_svnurl="http://svn.cherrypy.org/trunk/"
_svnmod="cherrypy"

build() {
cd ${srcdir}

msg "Checking out latest SVN version...."
svn checkout ${_svnurl} ${_svnmod}
msg "SVN checkout done or server timeout"

cd ${startdir}/src/cherrypy
python ./setup.py install --root=${startdir}/pkg
#~ install -D -m644 ${startdir}/src/license ${startdir}/pkg/usr/share/licenses/${pkgname}/license
}

# vim:set ts=2 sw=2 et:
