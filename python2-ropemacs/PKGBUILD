# Maintainer: Michael Bernhard Arp Sørensen <michael@arpsorensen.dk>

pkgname=python2-ropemacs
_pkgname=ropemacs
pkgver=0.7
pkgrel=2
pkgdesc='Emacs mode that uses rope_ library to provide features like python refactorings and code-assists.'
url='http://bitbucket.org/agr/ropemacs'
arch=('any')
license=('GPL')
depends=('python2-ropemode' 'pymacs')
source=("https://github.com/python-rope/ropemacs/archive/master.zip")
md5sums=('c4a364ce8167af48c703e4ff20609451')

package() {
  cd "${srcdir}/ropemacs-master"
  python2 ./setup.py install --root="${pkgdir}" --prefix=/usr
}
