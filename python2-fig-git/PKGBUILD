# Maintainer: Daniel YC Lin <dlin.tw at gmail>
pkgname=python2-fig-git
pkgver=0.2.2.r2.g1327e29
pkgrel=1
pkgdesc="Fast, isolated development environments using Docker"
arch=(any)
url="http://orchardup.github.io/fig"
license=('custom')
groups=()
depends=('python2-docopt=0.6.1' 'python2-yaml=3.10' 'python2-requests=2.2.1'
  'python2-six>=1.3.0' 'python2-texttable=0.8.1'
  'python2-websocket-client>=0.11.0')
makedepends=('python2' 'python2-setuptools')
provides=('python2-fig=0.2.2')
conflicts=(python2-fig)
replaces=()
backup=()
options=(!emptydirs)
install=
source=(repo::git+https://github.com/orchardup/fig.git)
md5sums=(SKIP)
pkgver() {
  cd "$srcdir/repo"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
package() {
  cd "$srcdir/repo"
  sed -i -e 's/websocket-client==0.11.0/websocket-client>=0.11.0/' \
    requirements.txt
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
