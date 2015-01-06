# Contributor: jperry <sh.jperry@gmail.com>
# use versionpkg

pkgname=gworkspace
pkgver=0.9.3
pkgrel=1
pkgdesc="The GNUstep Workspace"
arch=(i686 x86_64)
url="http://www.gnustep.org/experience/GWorkspace.html"
license=('GPL')
depends=(gnustep-base gnustep-gui gnustep-back)
makedepends=(gcc-objc)
provides=(gworkspace)
conflicts=(gworkspace)
replaces=(gworkspace.app-svn)
backup=()
install=
source=(ftp://ftp.gnustep.org/pub/gnustep/usr-apps/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('4c501c09ead7f4bb6c5c8bfdff722963')


build() {
  cd $srcdir/$pkgname-$pkgver
  # necessary to set environment if not in user startup.
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  ./configure --prefix=/opt/GNUstep
  make || return 1
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  make DESTDIR=$pkgdir install || return 1
}

