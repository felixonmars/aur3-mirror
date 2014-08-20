# Maintainer: Mike Cooper <mythmon@gmail.com>
# Based on package by: Akshay Suthar <akshay {dot} suthar {at} gmail {dot} com>

pkgname=python2-bugwarrior-git
pkgrel=4
pkgver="0.7.0.r172.ga531f3a"
pkgdesc="bugwarrior - Pull tickets from github, bitbucket, bugzilla, jira, trac, and others into taskwarrior. Git version"
arch=('any')
url="https://pypi.python.org/pypi/bugwarrior"
license=('GPLv3')
depends=(
    'python2'
    'python2-argparse'
    'python2-bitlyapi'
    'python2-bugzilla'
    'python2-dateutils>=0.6.6'
    'python2-dogpile-cache'
    'python2-dogpile-core'
    'python2-jinja>=2.7.2'
    'python2-keyring'
    'python2-lockfile>=0.9.1'
    'python2-offtrac'
    'python2-pycurl'
    'python2-pytz'
    'python2-requests'
    'python2-six'
    'python2-taskw'
    'python2-twiggy'
)
makedepends=('setuptools')
source=(git+https://github.com/ralphbean/bugwarrior.git)
md5sums=('SKIP')
provides=('python2-bugwarrior')
conflicts=('python2-bugwarrior')

pkgver() {
    cd "$srcdir/bugwarrior"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/bugwarrior"
    python2 setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
