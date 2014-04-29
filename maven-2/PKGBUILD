pkgname=maven-2
pkgver=2.2.1
pkgrel=2
pkgdesc="A Java project management and project comprehension tool"
arch=('any')
url="http://maven.apache.org"
license=('APACHE')
depends=('java-environment')
backup=(opt/maven/conf/settings.xml)
source=(http://archive.apache.org/dist/maven/binaries/apache-maven-$pkgver-bin.tar.gz \
	maven.sh)
md5sums=('3f829ed854cbacdaca8f809e4954c916'
         'cac30b2331aeb63e40297bbea7fffcc9')

provides=('maven')
conflicts=('maven')

build() {
  cd "$srcdir"
  mkdir "$pkgdir"/opt
  mv apache-maven-$pkgver "$pkgdir"/opt/maven
  install -D -m 755 "$srcdir"/maven.sh "$pkgdir"/etc/profile.d/maven.sh

  rm "$pkgdir"/opt/maven/*.txt
}
