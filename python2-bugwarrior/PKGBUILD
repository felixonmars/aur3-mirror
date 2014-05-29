# Maintainer: Akshay Suthar <akshay {dot} suthar {at} gmail {dot} com>

pkgname=python2-bugwarrior
pkgver=0.7.0
pkgrel=2
pkgdesc="bugwarrior - Pull tickets from github, bitbucket, bugzilla, jira, trac, and others into taskwarrior"
arch=('any')
url="https://pypi.python.org/pypi/bugwarrior"
license=('GPLv3+')
depends=('python2' 'python2-six' 'python2-keyring' 'python2-dogpile-cache' 'python2-bugzilla' 'python2-twiggy' 'python2-bitlyapi' 'python2-requests' 'python2-taskw' 'python2-dogpile-core' 'python2-pytz' 'python2-dateutil' 'python2-offtrac')
makedepends=('setuptools')
source=(https://github.com/ralphbean/bugwarrior/archive/0.7.0.zip)
md5sums=('951419c831f076b15cb2bd86b1f19d7a')

package() {
  cd "$srcdir/bugwarrior-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
