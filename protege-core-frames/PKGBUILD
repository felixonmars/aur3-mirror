# Contributor: Patrick Hanckmann <hanckmann@gmail.com>
_realname=protege
pkgname=$_realname-core-frames
_mainversion=3.4
_subversion=8
pkgver=$_mainversion.$_subversion
pkgrel=1
pkgdesc="Free, open source ontology editor and knowledge-base framework - core"
arch=('i686' 'x86_64')
url="http://protege.stanford.edu/"
license=('MPL')
conflicts=(protege)
depends=(java-runtime)
makedepends=(java-environment apache-ant javacc)
source=(http://$_realname.stanford.edu/download/$_realname/$_mainversion/sources/$_realname-src-$pkgver.zip)
md5sums=('5cf415344c4801419cbdca8d56f4eab5')

build() {
  cd "$srcdir/Protege $pkgver"
  /usr/share/java/apache-ant/bin/ant jar || return 1
  install -D "build/dist/$_realname.jar" "$pkgdir/usr/share/java/$_realname/$_realname.jar"
  install -d "$pkgdir/usr/share/java/$_realname/plugins"
  cp -r lib/* "$pkgdir/usr/share/java/$_realname"
  
  echo touch $_realname.sh || return 1
  echo '#!/bin/sh' > $_realname.sh || return 1
  echo 'for name in /usr/share/java/protege/*.jar ; do' >> $_realname.sh || return 1
  echo '  CP=$CP:$name' >> $_realname.sh || return 1
  echo 'done' >> $_realname.sh || return 1
  echo 'export PROTEGE_HOME=/usr/share/protege' >> $_realname.sh || return 1
  echo 'exec java -cp $CP edu.stanford.smi.protege.Application' >> $_realname.sh || return 1
  
  install -Dm755 "$_realname.sh" "$pkgdir/usr/bin/$_realname"
}
