# Contributor: William Rea <sillywilly@gmail.com>
pkgname=joscar
pkgver=0.9.3
pkgrel=1
pkgdesc="A Java library for AIM's OSCAR protocol"
url="http://joust.kano.net/joscar"
license="BSD"
depends=('jre')
makedepends=('jikes' 'apache-ant')
source=(http://superb-east.dl.sourceforge.net/sourceforge/joustim/joscar-$pkgver-src.tar.bz2)
md5sums=('f108dd3f696d9111dde02a9c8b12eebb')

build() {
  cd $startdir/src/joscar-$pkgver
  export antflags="jar -Dbuild.compiler=jikes"
  ant $antflags
  install -D joscar-0.9.3-bin.jar $startdir/pkg/usr/share/java/joscar-0.9.3.jar
  install -D LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
