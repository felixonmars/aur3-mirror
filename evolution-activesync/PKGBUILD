# Maintainer: Nils Schäfer <nils.schaefer@gmail.com>
pkgname=evolution-activesync
pkgver=0.92.5eof19c9db
pkgrel=1
pkgdesc="Provides full two-way synchronization for Syncevolution via ActiveSync"
arch=('i686' 'x86_64')
url="http://syncevolution.org/"
license=('GPL')
depends=('libwbxml')
optdepends=()
makedepends=()
source=(https://github.com/GNOME/evolution-activesync/archive/master.zip)
md5sums=('72d43dd9477d75108b14b7592729f143')

build() {
  cd ${srcdir}/$pkgname-*
  
  ./autogen.sh 
  ./configure --prefix=/usr --disable-camel-backend --disable-eplugin --disable-qtconfig --enable-activesync


  make 
}

package(){
  cd ${srcdir}/$pkgname-*
  make DESTDIR="${pkgdir}" install

}
