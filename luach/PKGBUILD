pkgname=luach
pkgver=0.02
pkgrel=1
pkgdesc="Hebrew calander using Qt4 library"
arch=('i686' 'x86_64') 
url="http://code.google.com/p/luach/"
license=('GPL2')
depends=('qt>=4.0' 'libhdate')
source=(http://luach.googlecode.com/files/Luach-0.02.tar.gz)
md5sums=(8b675428b191d41a8adf1ddb78633484) #generate with MD5sum

build() {
  cd "$srcdir/Luach"

  qmake
  make
  make INSTALL_ROOT="$pkgdir" install
}

