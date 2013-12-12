# Maintainer: Marcin Falkowski <mf44249 at st dot amu dot edu dot pl>

pkgname=meteor-eval
pkgver=1.4
pkgrel=1
pkgdesc="Automatic Machine Translation Evaluation System"
arch=('any')
url="http://www.cs.cmu.edu/~alavie/METEOR/"
license=("LGPL3")
depends=('java-runtime-headless>=7' 'python2')
makedepends=()
optdepends=()
install=
source=("http://www.cs.cmu.edu/~alavie/METEOR/download/meteor-$pkgver.tgz")
noextract=()
md5sums=('eef884e315be54021557153915f8461a')


package() {
  cd "$srcdir"
  install -d "$pkgdir"/{opt,usr/bin}
  mv meteor-$pkgver $pkgname
  cp -dpr --no-preserve=ownership $pkgname "$pkgdir"/opt
  ln -s meteor-$pkgver.jar "$pkgdir"/opt/$pkgname/$pkgname.jar
  cat > "$srcdir"/$pkgname.sh <<-EOF
    #!/bin/sh
    java -Xmx2G -jar /opt/$pkgname/$pkgname.jar "\$@"
EOF
  install -m755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
