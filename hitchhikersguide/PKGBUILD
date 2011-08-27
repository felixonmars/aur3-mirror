# Contributor: Florian Richter <Florian_Richter@gmx.de>
pkgname=hitchhikersguide
pkgver=59
pkgrel=1
pkgdesc="Hitchhiker's Guide to the Galaxy Infocom Adventure"
arch=('any')
url="http://www.douglasadams.com/creations/infocomjava.html"
license=('unkown')
depends=(java-runtime)
source=(http://www.douglasadams.com/creations/ZPlet.jar
            http://www.douglasadams.com/creations/hhgg.z3
            hitchhikersguide.sh
            hitchhikersguide.desktop)
noextract=(ZPlet.jar)
md5sums=('329882f93c3b434f0953d6146e048f42'
         '6666389f60e0c8e4ceb08242a263bb52'
         '1aaf48eec7fd329ef2c81c6ba9b8e1c4'
         'b25d7167e443fd001919227d3540e7c0')

build() {
  cd "$startdir/src/"
  install -D ZPlet.jar "$startdir/pkg/usr/share/java/hitchhikersguide/ZPlet.jar"
  install -D hhgg.z3 "$startdir/pkg/usr/share/hitchhikersguide/hhgg.z3"
  install -D hitchhikersguide.sh "$startdir/pkg/usr/bin/hitchhikersguide"
  install -D hitchhikersguide.desktop "$startdir/pkg/usr/share/applications/hitchhikersguide.desktop"
}

# vim:set ts=2 sw=2 et:
