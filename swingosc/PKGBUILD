# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: hm_b < holger @ music-nerds.net >

_name=SwingOSC
pkgname=swingosc
pkgver=0.70
pkgrel=1
pkgdesc="An OpenSoundControl (OSC) server intended for scripting Java(tm)"
arch=('any')
url="http://www.sciss.de/swingOSC/"
license=('GPL' 'LGPL' 'Apache')
depends=('java-runtime>=6')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/swingosc/$pkgver/$_name-$pkgver-Linux.zip")
md5sums=('cb4476bc48a75cc952e27bad4b95e65d')

package() {
  cd "$srcdir"

  # scritps
  install -d "$pkgdir/usr/bin"
  install -Dm755 ${_name}_{TCP,UDP}.sh "$pkgdir/usr/bin"

  # jar
  install -Dm644 $_name.jar "$pkgdir/usr/bin"

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname/SuperCollider"
  install -Dm644 README.md CHANGES.md \
    "$pkgdir/usr/share/doc/$pkgname"
  cp -a SuperCollider/{README.md,todo.txt,examples} \
    "$pkgdir/usr/share/doc/$pkgname/SuperCollider"
  cp -a PureData "$pkgdir/usr/share/doc/$pkgname"

  # supercollider extensions
  install -d "$pkgdir/usr/share/SuperCollider/Extensions"
  cp -a SuperCollider/SwingOSC "$pkgdir/usr/share/SuperCollider/Extensions"
}
