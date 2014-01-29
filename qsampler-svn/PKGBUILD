# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Bernardo Barros <bernardobarros dot gmail dot com>
# Contributor: Maciej Ciemborowicz <moonkey@op.pl>

pkgname=qsampler-svn
pkgver=0.2.3.1.r551
pkgrel=1
pkgdesc="Qt frontend to LinuxSampler"
arch=('i686' 'x86_64')
url="http://www.linuxsampler.org/"
license=('GPL')
depends=('qt5-base' 'liblscp-svn' 'linuxsampler-svn' 'shared-mime-info' 'hicolor-icon-theme')
makedepends=('svn' 'qt5-tools')
optdepends=('gigedit: edit gigasampler files')
provides=('qsampler')
conflicts=('qsampler')
install="$pkgname.install"
source=("$pkgname::svn+http://svn.code.sf.net/p/qsampler/code/trunk")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  echo $(sed -n 's/AC_INIT(Qsampler, \([^,]*\).*/\1/p' configure.ac).r$(svnversion)
}

build() {
  cd $pkgname
  make -f Makefile.svn
  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
}

