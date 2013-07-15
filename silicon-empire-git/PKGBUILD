# Contributor: archtux <antonio.arias99999@gmail.com>
# Maintainer: Dany Martineau <dany.luc.martineau@gmail.com}

pkgname=silicon-empire-git
_gitname=silicon-empire
pkgver=263.120d384
pkgrel=1
pkgdesc="Set of tools to manage and organize your optical discs like CDs, DVDs and Blu-rays."
arch=('i686' 'x86_64')
url="http://getsilicon.org/"
license=('GPL3')
depends=('fuseiso' 'phonon' 'taglib')
makedepends=('git')
conflicts=('silicon-empire')
source=('silicon-empire::git+https://git.gitorious.org/silicon/empire.git'
 	'qtlocalpeer.diff')
md5sums=('SKIP'
	 '19fd34c24398f0ff2df99599b67fbda8')

pkgver()
{
    cd "${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
 
build() {

  cd ${_gitname}/src
  patch -p0 < ../../../qtlocalpeer.diff
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
     -DQT_QMAKE_EXECUTABLE=qmake-qt4
  make
}

package() {
  cd ${srcdir}/${_gitname}/src/build
  make DESTDIR=${pkgdir} install
}