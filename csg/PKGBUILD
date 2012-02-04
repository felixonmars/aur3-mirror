# Contributor: Christian Hesse <mail@earthworm.de>

pkgname=csg
pkgver=1.01beta
pkgrel=1
pkgdesc="CSG - Cache Statistic Generator"
arch=('any')
depends=("java-runtime")
url="http://cachestatgen.ca.funpic.de/"
license=('GPL')
source=("http://statistica-online.co.de/csg.jar")

build() {
  install -D "$srcdir/csg.jar" "$pkgdir/opt/csg/csg.jar"

  mkdir -p "$pkgdir/usr/bin/"
  cat > "$pkgdir/usr/bin/csg" <<EOF
#!/bin/sh

java -jar /opt/csg/csg.jar
EOF

  chmod 0755 "$pkgdir/usr/bin/csg"
}

# vim:set ts=2 sw=2 et:

md5sums=('07267e5b8ff7e36d67a34eabc45c8a32')
