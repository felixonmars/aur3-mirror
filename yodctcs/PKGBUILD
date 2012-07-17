# Maintainer: kevku <kevku@gmx.com>
pkgname=yodctcs
pkgver=0.7.3
pkgrel=1
pkgdesc="Interface for monitoring and managing Enhanced CTorrent"
arch=('x86_64' 'i686')
url="http://sites.google.com/site/yodctcs/"
license=('GPL')
depends=('enhanced-ctorrent')
makedepends=('gwt')
source=("http://sites.google.com/site/yodctcs/dctcs-$pkgver.src.tar.gz"
        "sched.patch")
md5sums=('dffc17c3f1dbdda0db23d73021f2a84a'
         '2837d9c7312f35f2752d5a669c31702e')

build() {
  cd "$srcdir/dctcs.src"
  cd src 
  patch -i "$srcdir/sched.patch"
  cd ..
  rm ltmain.sh
  ln -s /usr/share/libtool/config/ltmain.sh ltmain.sh
  ./autogen.sh
  ./configure --prefix=/usr
  make
  java -cp "./java/src:/opt/gwt/gwt-dev.jar:/opt/gwt/gwt-user.jar:/opt/gwt/validation-api-1.0.0.GA.jar:/opt/gwt/validation-api-1.0.0.GA-sources.jar" com.google.gwt.dev.Compiler -war "www" darkside.ctcs.gui
}

package() {
  cd "$srcdir/dctcs.src"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/dctcs/www"
  cp -r www/darkside.ctcs.gui "$pkgdir/usr/share/dctcs/www"
  install -D dctcs.conf "$pkgdir/usr/share/dctcs/dctcs.conf.example"
}

# vim:set ts=2 sw=2 et:
