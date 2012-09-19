# Maintainer: Jonas Jelten <jonas.jelten@gmail.com>
pkgname=brutal-file-manager
pkgver=1.2
pkgrel=1
epoch=
pkgdesc="A first person file manager. Delete your files brutally with weapons."
arch=(any)
url="http://www.forchheimer.se/bfm/"
license=('GPL2')
groups=()
depends=(java-environment java3d bash)
makedepends=()
checkdepends=()
optdepends=()
provides=(bfm)
conflicts=(bfm)
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.forchheimer.se/bfm/releases/bfm-$pkgver.tar.gz
        http://www.forchheimer.se/bfm/docs/bfm.conf
        http://www.forchheimer.se/bfm/docs/bindings)

noextract=()
md5sums=('12eb3ae43f459a9ebd83e6daad286453'
         'e01f3fbdee09a5591a794dc294709a3a'
         '2d95160121bd72597b9a3dc38510f8d6')
build() {
  cd "$srcdir/bfm-$pkgver/src"
  rm -f *.class
  
  mkdir -p "$srcdir/bfm-$pkgver/src/encoded"
  for file in *.java ;
  do
    cat $file | iconv -f ISO8859-2 -t UTF-8 -o encoded/$file
  done

  mv encoded/*.java .
  javac -Xlint:deprecation -Xlint:unchecked Bfm.java
  rm -r encoded

  jar cmf data/manifest bfm.jar *.class data/
}

package() {
  cd "$srcdir/bfm-$pkgver/src"
  install -D -m644 bfm.jar $pkgdir/usr/share/brutal-file-manager/bfm.jar
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/etc/bfm/
  mkdir -p $pkgdir/usr/share/docs/brutal-file-manager

  cp $startdir/bfm.conf $pkgdir/etc/bfm/
  cp $startdir/bindings $pkgdir/usr/share/docs/brutal-file-manager/keybindings

  echo "#!/bin/bash
# look in /etc/bfm/bmf.conf for configuration

java -jar /usr/share/brutal-file-manager/bfm.jar \$*" > $pkgdir/usr/bin/brutal-file-manager
  chmod +x $pkgdir/usr/bin/brutal-file-manager

  ln -s brutal-file-manager $pkgdir/usr/bin/bfm
}

# vim:set ts=2 sw=2 et:
