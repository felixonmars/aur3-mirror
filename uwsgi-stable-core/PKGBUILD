
pkgname=('uwsgi-stable-core')
_pkgbase=uwsgi
pkgver=1.9.12
pkgrel=1
epoch=
pkgdesc="uWSGI is a fast, self-healing and developer/sysadmin-friendly application container server coded in pure C. Splitted package to support python, python2, ruby (rack), ... "
arch=(i686 x86_64 arm armv6h)
url="http://projects.unbit.it/uwsgi/"
license=('GPL2')
groups=()
depends=('libyaml' 'jansson')
makedepends=('python')
checkdepends=()
provides=('uwsgi-core')
conflicts=('uwsgi' 'uwsgi-core')
replaces=('uwsgi')
backup=()
options=()
install=
changelog=
source=("http://projects.unbit.it/downloads/${_pkgbase}-${pkgver}.tar.gz")
noextract=()
md5sums=('93e561fcd4d7da48aafaf2a85095df58')


build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python uwsgiconfig.py --build package

}

package_uwsgi-stable-core() {

  cd "$srcdir/$_pkgbase-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 uwsgi "$pkgdir/usr/bin/uwsgi"
}

