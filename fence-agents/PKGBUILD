# Maintainer: Antoni Segura Puimedon <antonisp@celebdor.com>
pkgname=fence-agents
pkgver=4.0.5
pkgrel=1
pkgdesc="Fence agents are a scripts to handle remote power management for cluster devices."
arch=('i686' 'x86_64')
url="https://git.fedorahosted.org/git/fence-agents.git"
license=('LGPL')
groups=()
depends=(
    'python2-pexpect'
    'python2-pycurl'
    'perl-net-telnet'
    'python2-suds'
)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://git.fedorahosted.org/cgit/fence-agents.git/snapshot/fence-agents-4.0.5.tar.bz2")
sha256sums=('1464ec0ea3cf4b9cf4c2dc96c4d6e872d3b85788457f58c367b0ba9ed404f0f3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  find . -type f | xargs sed -i -e 's/python /python2 /g'
  find . -type f | xargs sed -i -e 's/\usr\/bin\/python/\/usr\/bin\/python2/g'
  ./autogen.sh
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
