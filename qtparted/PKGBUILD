# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Maintainer: André Fettouhi < A dot Fettouhi at gmail dot com>
pkgname=qtparted
pkgver=0.6.0
pkgrel=4
pkgdesc='QTParted is a Partition Magic clone written in C++ using the Qt toolkit'
arch=('i686' 'x86_64')
url='http://qtparted.sourceforge.net/'
license=('GPL2')
depends=('parted>=1.6.6' 'qt4>=4.5' 'e2fsprogs' 'dosfstools' 'jfsutils' 'progsreiserfs' 'xfsprogs')
makedepends=('ntfsprogs' 'cmake')
optdepends=('gksu: to run gparted directly from menu')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.xz/download")
md5sums=('5f999a825870a947e5582f8f931d7820')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 . || return 1
  make || return 1
}

package(){
  cd ${srcdir}/${pkgname}-${pkgver}    
  make DESTDIR="${pkgdir}" install || return 1
  
  sed -i -e "s:Exec=qtparted:Exec=gksu /usr/bin/qtparted:g" ${pkgdir}/usr/share/applications/qtparted.desktop || return 1
}
