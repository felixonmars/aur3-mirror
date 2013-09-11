# Contributor: lk <li_likun{at}sohu{dot}com>


pkgname="pidgin-openfetion"
pkgver=0.3
pkgrel=1
pkgdesc="Fetion plugin for pidgin"

arch=("i686" "x86_64")

url="http://ofetion.googlecode.com"
license=("GPL")

depends=("openssl" "libxml2" "gtk2" "sqlite3" "librsvg" "pidgin")
makedepends=("mercurial" "pkg-config" "intltool" "cmake")
optdepends=("libnotify" "gstreamer0.10" "networkmanager" "libxss")

source=("http://ofetion.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('951216aaaa9f9d41210555f7f957c4fe')


build() {

  cd "${srcdir}/${pkgname}-${pkgver}"
  
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
