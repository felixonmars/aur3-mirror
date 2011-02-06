# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=moonlight3d
pkgver=0.2.3
pkgrel=1
pkgdesc="Modern, flexible and extensible modelling and animation tool"
arch=('i686' 'x86_64')
url="http://www.moonlight3d.eu/"
license=('GPL')
depends=('java-runtime' 'qt' 'libstdc++5' 'libgl')
#depends=('qtjambi') # outdated on AUR
optdepends=('sunflow: for rendering')
source=(http://dev.moonlight3d.eu/downloads/moonlight-$pkgver-Linux-$CARCH.tar.bz2 \
        moonlight.sh mlbatch.sh moonlight3d.desktop)
if [ $CARCH = "i686" ]; then
  md5sums=('66a38f8f72f52dbf6d99c78d16352feb'
           'b313a7a9f5f6143c49628989f89aa53e'
           '6741f7d5c9df0f856f6a156230306284'
           'f77d8f13d103dbbf3053eac688deadc4')
elif [ $CARCH = "x86_64" ]; then
  md5sums=('e5b689d9d589d3cfdb91536b0bd86956'
           'b313a7a9f5f6143c49628989f89aa53e'
           '6741f7d5c9df0f856f6a156230306284'
           'f77d8f13d103dbbf3053eac688deadc4')
fi

build() {
  cd "$srcdir"/Moonlight-$pkgver-Linux-$CARCH/

  install -D -m644 ml3d.jar "$pkgdir"/usr/share/java/$pkgname/ml3d.jar
#  cp -r {icons,lib,plugins,propsheet,scripts} "$pkgdir"/usr/share/java/$pkgname
  mkdir -p "$pkgdir"/usr/share/$pkgname
  cp -r {icons,plugins,propsheet,scripts} "$pkgdir"/usr/share/$pkgname
  cp -r lib "$pkgdir"/usr/share/java/$pkgname

  # clean from libraries that are already in system
  rm "$pkgdir"/usr/share/java/$pkgname/lib/Linux/$CARCH/libQt*
  rm "$pkgdir"/usr/share/java/$pkgname/lib/Linux/$CARCH/libstdc++.so.5
  rm "$pkgdir"/usr/share/java/$pkgname/lib/jar/{janino,sunflow}.jar
  #rm "$pkgdir"/usr/share/java/$pkgname/lib/Linux/$CARCH/qtjambi.jar #outdated on AUR

  install -D -m755 "$srcdir"/moonlight.sh "$pkgdir"/usr/bin/moonlight
  install -D -m755 "$srcdir"/mlbatch.sh "$pkgdir"/usr/bin/mlbatch

  install -D -m644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}

# vim:set ts=2 sw=2 et:
