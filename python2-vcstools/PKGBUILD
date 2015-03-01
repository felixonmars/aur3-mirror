# Contributor: Georg Bremer <pkgbuild@dschoordsch.de>

pkgname='python2-vcstools'
pkgver=0.1.36
pkgrel=1
pkgdesc='API for interacting with different version control systems (VCS/SCMs)'
arch=('any')
url="http://ros.org/"
license=('BSD')
depends=('python2' 'python2-yaml')
makedepends=('python2-setuptools')
conflicts=('vcstools')
replaces=('vcstools')
source=("http://download.ros.org/downloads/vcstools/vcstools-$pkgver.tar.gz")
md5sums=('e3ef997da464cf284ca36fd60e993ed6')

package() {
    cd "$srcdir/vcstools-$pkgver"
    python2 setup.py install --root "$pkgdir"
}
# vim:set ts=2 sw=2 et:
