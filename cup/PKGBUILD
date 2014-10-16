# Maintainer: Cyker Way <cykerway at gmail.com>

pkgname=cup
pkgver=11b
pkgrel=1
pkgdesc="LALR parser generator for Java"
arch=('any')
url="http://www2.cs.tum.edu/projects/cup/"
license=('custom')
depends=('java-runtime')

install=$pkgname.install

source=(http://www2.cs.tum.edu/projects/cup/java-cup-11b.jar
        http://www2.cs.tum.edu/projects/cup/java-cup-11b-runtime.jar
        $pkgname.sh
        LICENSE
        )

md5sums=('706f313050243bd99225ac26abb4cffe'
         'd51cec4a8715dfc61e7276194f8fae33'
         '5802055371a2f78213ad91d63cdae89c'
         '1f1f11b46dbbff0df50b06ca092e9c28')

package() {
    install -m644 -D $srcdir/java-cup-11b.jar \
      $pkgdir/usr/share/java/$pkgname/java-cup-11b.jar
    install -m644 -D $srcdir/java-cup-11b-runtime.jar \
      $pkgdir/usr/share/java/$pkgname/java-cup-11b-runtime.jar
    install -m755 -D $srcdir/$pkgname.sh \
      $pkgdir/usr/bin/$pkgname
    install -m644 -D $srcdir/LICENSE \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
