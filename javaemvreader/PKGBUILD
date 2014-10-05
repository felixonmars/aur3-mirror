pkgname=javaemvreader
pkgver=0.6.0
pkgrel=1
pkgdesc='Java EMV Reader/Terminal'
arch=('i686', 'x86_64')
license=('APACHE')
url="https://code.google.com/p/javaemvreader"
depends=('java-runtime')
makedepends=('maven' 'svn')
source=("javaemvreader::svn+http://javaemvreader.googlecode.com/svn/trunk/#revision=20")
md5sums=('SKIP')

build()
{
  cd "$srcdir/javaemvreader"
  mvn package
}

package ()
{
  cd "$srcdir/javaemvreader"
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/java/javaemvreader
  install -m644  target/javaemvreader-*-SNAPSHOT-full.jar "$pkgdir"/usr/share/java/javaemvreader
  echo "#!/bin/sh" > run
  echo 'exec "$JAVA_HOME/bin/java" -jar `ls /usr/share/java/javaemvreader/javaemvreader-*-SNAPSHOT-full.jar` "$@"' >> run
  install -m755 run "$pkgdir"/usr/bin/javaemvreader
}
