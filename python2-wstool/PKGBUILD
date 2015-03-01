# Contributor: Georg Bremer <pkgbuild@dschoordsch.de>

pkgname='python2-wstool'
pkgver=0.1.6
pkgrel=1
pkgdesc='wstool provides commands to manage several local SCM repositories (supports git, mercurial, subversion, bazaar) based on a single workspace definition file (.rosinstall)'
arch=('any')
url="http://ros.org/"
license=('BSD')
depends=('python2' 'python2-yaml' 'python2-vcstools')
makedepends=('python2-setuptools')
optdepends=()
provides=('wstool')
conflicts=('wstool')
source=("http://download.ros.org/downloads/wstool/wstool-$pkgver.tar.gz")
md5sums=('38cbe5a549c2c1eec017f6d92181674c')

package() {
    cd "$srcdir/wstool-$pkgver"
    python2 setup.py install --root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
