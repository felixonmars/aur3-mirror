# Maintainer: Harley Laue <losinggeneration@gmail.com>

pkgname=gluon-git
pkgver=4083.a264854
pkgrel=1
pkgdesc="A Free and Open Source framework for creating and distributing games"
arch=('i686' 'x86_64')
url="http://gluon.gamingfreedom.org/"
license=('LGPL')
depends=('kdebase-runtime' 'kdevplatform' 'alure' 'assimp')
makedepends=('git' 'mercurial' 'bzr' 'cvs' 'subversion' 'openssh' 'cmake' 'automoc4' 'mesa')
provides=('gluon')
conflicts=('gluon')
install=gluon.install
optdepends=(
  'git: For git VCS support in the creator'
  'mercurial: For hg VCS support in the creator'
  'bzr: For bzr VCS support in the creator'
  'cvs: For csv VCS support in the creator'
  'subversion: For svn VCS support in the creator'
  'openssh: For SCP support within Gluon'
)
source=(
	"git+git://anongit.kde.org/gluon.git"
)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/gluon"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/gluon"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_GLUON_CREATOR_VCS=ON \
        -DBUILD_PHYSICS_COMPONENTS=ON \
        -DBUILD_PHYSICS_ASSETS=ON
  make
}

package() {
  cd "$srcdir/gluon"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
