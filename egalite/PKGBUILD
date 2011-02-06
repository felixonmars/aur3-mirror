# Maintainer: Bernd Stramm <bernd.stramm@gmail.com>
# Packager: Samir Faci <csgeek@esamir.com> 

pkgname=egalite
pkgver=0.3.5
pkgrel=1
pkgdesc="direct chat client using qxmpp implementing  an almost server-less chat." 
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/egalite/"
license=('GPLv2')
groups=()
depends=('qt' 'qxmpp' 'qca')
makedepends=()
optdepends=()
provides=()
conflicts=(egalite-git)
replaces=()
backup=()
options=()
install=
changelog=
source=("http://voxel.dl.sourceforge.net/project/egalite/release-0.3.5/egalite-0.3.5.tar.gz")
noextract=()
md5sums=('2fa38e04e4a68467167377ba145fab02')




build() 
{
  cd ${srcdir}/$pkgname-$pkgver

  ./configure --qxmppname=qxmpp
  qmake 
  make
}

package() {
  echo "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

