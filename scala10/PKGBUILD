# $Id$
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: James Bulmer <nekinie@gmail.com>
pkgbase=scala10
pkgname=(scala10 scala10-docs scala10-sources)
pkgver=2.10.4
pkgrel=2
pkgdesc="A Java-interoperable language with object-oriented and functional features"
arch=('any')
url="http://www.scala-lang.org"
license=('BSD')
depends=('java-runtime')
source=("http://www.scala-lang.org/files/archive/scala-${pkgver}.tgz"
	"http://www.scala-lang.org/files/archive/scala-docs-${pkgver}.txz")
md5sums=('11854f09c35312d9f6966e163e6e436c'
         'eb495c772063437cfdf8c7515f1e5e64')

package_scala10() {
  depends=('java-runtime')
  optdepends=('scala10-docs' 'scala10-sources' 'graphviz: generate diagrams')
  conflicts=('scala')

  cd ${srcdir}/scala-${pkgver}

  install -d ${pkgdir}/usr/{bin,share} ${pkgdir}/usr/share/man/man1 ${pkgdir}/usr/share/scala/{bin,lib}
  cp -r {lib,misc} ${pkgdir}/usr/share/scala/
  cp -r man ${pkgdir}/usr/share/
  install -m 755 bin/{fsc,scala,scalac,scalap,scaladoc} ${pkgdir}/usr/share/scala/bin
  install -D -m0644 doc/LICENSE ${pkgdir}/usr/share/licenses/scala/LICENSE

  ln -s ../share/scala/bin/fsc ${pkgdir}/usr/bin/fsc
  ln -s ../share/scala/bin/scala ${pkgdir}/usr/bin/scala
  ln -s ../share/scala/bin/scalac ${pkgdir}/usr/bin/scalac
  ln -s ../share/scala/bin/scalap ${pkgdir}/usr/bin/scalap
  ln -s ../share/scala/bin/scaladoc ${pkgdir}/usr/bin/scaladoc
}

package_scala10-docs() {
  replaces=('scala-docs' 'scala-devel-docs')
  pkgdesc="Scala documentation"
  depends=()
  conflicts=('scala-docs')

  cd ${srcdir}
  mkdir -p $pkgdir/usr/share/doc/
  cp -r scala-docs-${pkgver} $pkgdir/usr/share/doc/scala
  install -D -m0644 ${srcdir}/scala-${pkgver}/doc/LICENSE ${pkgdir}/usr/share/licenses/scala-docs/LICENSE
}

package_scala10-sources() {
  replaces=('scala-src')
  pkgdesc="Scala sources"
  depends=()
  conflicts=('scala-sources')

  cd ${srcdir}/scala-sources-${pkgver}
  mkdir -p $pkgdir/usr/share/scala/
  cp -r src $pkgdir/usr/share/scala/src
  install -D -m0644 doc/LICENSE ${pkgdir}/usr/share/licenses/scala-sources/LICENSE
}
