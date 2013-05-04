#Contributor: Martin Špelina<shpelda [at]gmail[dot]com>
#Maintainer: Martin Špelina<shpelda [at]gmail[dot]com>
pkgname=umlgraph
pkgver=5.6
pkgrel=1
pkgdesc="Declarative Drawing of UML Diagrams"
url="http://www.umlgraph.org/"
license=('custom')
arch=('any')
depends=(java-environment plotutils graphviz)
makedepends=(coreutils sed grep unzip)
source=(''$pkgname'_'$pkgver'::http://www.umlgraph.org/UMLGraph-'$pkgver'.tar.gz')
md5sums=('564e01a6e97ed7587f1d98ce8ff5e72b')

package() {
  __java_lib=/usr/share/java/$pkgname
  __doc=/usr/share/doc/$pkgname
  __pic_lib=/usr/share/$pkgname
  __cmd_launch=/usr/bin/umlgraph
  mkdir -p $pkgdir/$__java_lib
  mkdir -p $pkgdir/$__pic_lib
  mkdir -p $pkgdir/$__doc
  mkdir -p $pkgdir/$__etc
  mkdir -p $pkgdir/`dirname $__cmd_launch`
  cd $srcdir/UMLGraph-$pkgver
  cp lib/*.jar $pkgdir/$__java_lib
  cp lib/*.pic $pkgdir/$__pic_lib
  cp -r doc/*  $pkgdir/$__doc
  #make a launch scripts
  cat bin/umlgraph | sed -s 's|UMLGRAPH_HOME=.*|UMLGRAPH_HOME='$__java_lib'|g' > $pkgdir/$__cmd_launch
  chmod 755 $pkgdir/$__cmd_launch
}
