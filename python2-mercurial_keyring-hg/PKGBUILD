# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
pkgname=python2-mercurial_keyring-hg
_hgname=mercurial_keyring
_hgtag=0.5.7
pkgver=0.5.7.120
pkgrel=1
pkgdesc="Mercurial Keyring Extension"
arch=('any')
url="http://pypi.python.org/pypi/mercurial_keyring"
license=('BSD')
makedepends=('mercurial' 'python2-distribute')
depends=('python2-keyring' 'python2')
conflicts=('python2-mercurial_keyring')
provides=('python2-mercurial_keyring')
source=(hg+https://bitbucket.org/Mekk/$_hgname#tag=$_hgtag)
md5sums=('SKIP')

pkgver() {
  cd $_hgname
  echo ${_hgtag}.$(hg identify -n)
}
package() {
  cd $_hgname
  PYTHON=python2
  ${PYTHON} setup.py install --root=$pkgdir || return 1
}
