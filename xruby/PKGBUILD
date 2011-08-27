# Contributor: FaziBear <fazibear@gmail.com>

pkgname="xruby"
pkgver=0.3.2
pkgrel=1
pkgdesc="XRuby is the first Ruby to Java compiler which compiles Ruby source code (.rb) to Java bytecode (.class)."
arch=('i686' 'x86_64')
url="http://code.google.com/p/xruby/"
license=(GPL)
depends=('jre' 'jdk')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
groups=()
options=()
install=()
source=("http://xruby.googlecode.com/files/$pkgname-$pkgver-src.zip" 'xruby.sh')
noextract=()
md5sums=('839a4246355fcacf1ca0f4407e36d16c' '7884ab66d4e384cce4518bcfbb3c28b6')
         
build() {
  cd $startdir/src/xruby
  sh build.sh
  install -D -m644 $startdir/src/xruby/xruby-$pkgver.jar $startdir/pkg/opt/xruby/xruby.jar
  install -D -m755 $startdir/xruby.sh $startdir/pkg/usr/bin/xruby
}
