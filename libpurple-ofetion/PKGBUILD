pkgname="libpurple-ofetion"
_realname="pidgin-openfetion"
pkgver=0.3
pkgrel=1
pkgdesc="Fetion plugin for libpurple"

arch=("i686" "x86_64")

url="http://code.google.com/p/ofetion/"
license=("GPL")

depends=("openssl" "libxml2" "sqlite3" "librsvg" "libpurple")
makedepends=("pkg-config" "cmake")
optdepends=("libnotify" "gstreamer0.10" "networkmanager" "libxss")

source=("http://ofetion.googlecode.com/files/${_realname}-${pkgver}.tar.gz"
        "no-pidgin.patch")
md5sums=('951216aaaa9f9d41210555f7f957c4fe'
         'd06eda30197fead8703031707d90f629')


build() {
  cd "$srcdir/${_realname}-${pkgver}"
  patch -p0 < ../no-pidgin.patch
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package(){
  cd "$srcdir/${_realname}-${pkgver}"
  make DESTDIR=${pkgdir} install
} 
