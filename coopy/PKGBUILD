# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=coopy
pkgver=0.6.3
pkgrel=1
pkgdesc="A set of tools for distributed data projects."
arch=(i686 x86_64)
url="http://share.find.coop/"
license=('GPL')
depends=('wxgtk')
makedepends=('cmake' 'java-environment>=6' 'php' 'python2' 'ruby')
optdepends=('java-environment>=6: java bindings'
            'php: php bindings'
            'python2: python bindings'
            'ruby: ruby bindings')
source=("http://downloads.sourceforge.net/project/$pkgname/v$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.png" "$pkgname.desktop")
md5sums=('a2666b669d3fa0b67aa79bf5374e48e5'
         'd38cc8a37dc818770fd34d88f9f70dee'
         '442bfffa3ac2d1eb3360f6535d7f84b7')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # man dir fix
  sed -i "/DESTINATION/s/man/share\/&/" conf/CoopyDoc.cmake

  [ -d bld ] || mkdir bld && cd bld
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DGENERATE_MAN_PAGES=ON
  make

  # wrong lib name
  sed -i "s/sheet/coopy/" CoopyConfig.cmake

  # bindings
  for _b in JAVA PHP PYTHON RUBY; do
    [ -d bld-$_b ] || mkdir bld-$_b && pushd bld-$_b
    Coopy_DIR=.. \
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DCREATE_$_b=ON \
          ../../bindings
    # rpath fix
    find . -name link.txt -exec sed -i "s/rpath/rpath-link/g" {} \;
    # build - there's an issue with java bindings generation, manual fix
    make || ( sed -i "/void setDelta/,/^$/d" coopy/SheetRow.java && \
              javac -source 1.3 -target 1.3 coopy/*.java && \
              jar cvf coopy.jar coopy/*.class )
  popd
  done
}

package() {
  cd "$srcdir/$pkgname-$pkgver/bld"

  make DESTDIR="$pkgdir/" install

  ## bindings

  # java
  install -Dm755 bld-JAVA/libcoopy.so \
    "$pkgdir/usr/lib/jni/libcoopy.so"
  install -Dm644 bld-JAVA/coopy.jar \
    "$pkgdir/usr/share/java/coopy.jar"

  # php
  install -Dm755 bld-PHP/coopy.so \
    "$pkgdir/usr/lib/php/modules/coopy.so"

  # python
  install -d "$pkgdir/usr/lib/python2.7/site-packages"
  install -Dm755 bld-PYTHON/{_coopy.so,coopy.py} \
    "$pkgdir/usr/lib/python2.7/site-packages"

  # ruby
  install -Dm755 bld-RUBY/coopy.so \
    "$pkgdir/usr/lib/ruby/vendor_ruby/1.9.1/$CARCH-linux/coopy.so"

  # examples
  install -d "$pkgdir/usr/share/$pkgname/examples"
  install -Dm644 ../bindings/examples/* \
    "$pkgdir/usr/share/$pkgname/examples"

  # desktop file
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 "$srcdir/$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
