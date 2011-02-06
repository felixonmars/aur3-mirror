# Maintainer: xduugu
pkgname=eclipse-scala
pkgver=2.7.7
pkgrel=1
pkgdesc="scala IDE for eclipse"
arch=('any')
url="http://www.scala-lang.org/node/94"
license=('BSD')
depends=('eclipse>=3.5')
source=(http://www.scala-lang.org/sites/default/files/linuxsoft_archives/downloads/distrib/files/ch.epfl.lamp.sdt_$pkgver.final.zip)
md5sums=('369396d546f07d3334fd59931a5ffa1b')
sha256sums=('2c73f5212445200a165bd51d4d33e01cc765373fafea326f41be8bce0cfe5ddd')

build() {
  local dest="$pkgdir/usr/share/eclipse/dropins/$pkgname/eclipse"

  install -d "$dest" &&
  mv "$srcdir/"{features,plugins} "$dest" || return 1

  # install license
  bsdtar xOf "$dest/features/ch.epfl.lamp.sdt_$pkgver.final.jar" feature.xml \
    | grep -P "<license.*>(.*\n)+\s*</license>" \
    | sed '1d;2s/^\s*//;s/&apos;/'"'"'/g;$d' > "$srcdir/LICENSE" &&
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1

  cd "$dest/plugins" || return 1
  local i
  for i in org.aspectj.*; do
    mkdir ${i%.*} && bsdtar xf $i -C ${i%.*} && rm $i || return 1
  done

  chmod -R a=r,u+w,a+X "$dest" || return 1
}

# vim:set ts=2 sw=2 et:
