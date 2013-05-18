pkgname=maven2-opt
pkgver=2.2.1
pkgrel=2
pkgdesc="A Java project management and project comprehension tool"
arch=('any')
url="http://maven.apache.org"
license=('APACHE')
depends=('java-environment')
backup=(opt/maven2/conf/settings.xml)
source=(http://apache.rinet.ru/dist/maven/maven-2/$pkgver/binaries/apache-maven-$pkgver-bin.tar.bz2 \
	maven2-opt.sh
	usemvn.sh)
md5sums=('c581a15cb0001d9b771ad6df7c8156f8'
         '5ed0bddbf5c5375fe5032a76a9506426'
         '91239de613a52dc42ec5b434b4871a32')

install=maven2-opt.install

build() {
  cd "$srcdir"
  mkdir "$pkgdir"/opt
  mv apache-maven-$pkgver "$pkgdir"/opt/maven2
  install -m 644 "$srcdir"/usemvn.sh "$pkgdir"/opt/maven2/bin/
  install -D -m 755 "$srcdir"/maven2-opt.sh "$pkgdir"/etc/profile.d/maven2-opt.sh

  rm "$pkgdir"/opt/maven2/*.txt
}

