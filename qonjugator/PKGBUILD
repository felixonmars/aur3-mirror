# Contributor: Larry Hajali <larryhaja [at] gmail [dot] com>

pkgname=qonjugator
pkgver=0.17
pkgrel=1
pkgdesc="Software which allows the user to conjugate verbs in different languages."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Qonjugator?content=112576"
license=('GPL')
depends=('kdelibs>=4.3.0' 'qt>=4.7.0')
makedepends=('cmake')
install=qonjugator.install
source=(http://www.opendesktop.org/CONTENT/content-files/112575-${pkgname}-${pkgver}.tar.bz2)
md5sums=('5225974e0147bb93f84c4e33141cbfbb')

build()
{
  cd $pkgname-$pkgver || return 1

  mkdir build || return 1
  cd build || return 1
  cmake -DCMAKE_INSTALL_PREFIX="/usr" .. || return 1
  make VERBOSE=1 || return 1
}

package()
{
  cd $pkgname-$pkgver/build

  make install DESTDIR="$pkgdir" || return 1
  cd .. || return 1

  for _pic in 22 128; do
    install -Dm0644 ${pkgname}gui/images/${pkgname}-${_pic}.png \
      "$pkgdir"/usr/share/icons/hicolor/${_pic}x${_pic}/apps/$pkgname.png || return 1
  done
}
