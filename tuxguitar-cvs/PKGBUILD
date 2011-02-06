# Contributor:  Johannes Wegener <ih-mon@gmx.de>
arch=(i686)
pkgname=tuxguitar-cvs
pkgver=20080105
pkgrel=1
pkgdesc="multitrack guitar tablature editor and player - cvs version"
url="http://www.tuxguitar.com.ar/"
license=('GPL')
depends=('jre' 'swt')
provides=('tuxguitar')
conflicts=('tuxguitar')
makedepends=('cvs' 'apache-ant' 'jdk')
md5sums=('c348a4b0a7a3a53aa7188e17c1f38a61')
source=('build.properties')
_cvsroot=":pserver:anonymous:@tuxguitar.cvs.sourceforge.net:/cvsroot/tuxguitar"
_cvsmod="TuxGuitar"

build() {
  cd $startdir/src
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -P TuxGuitar
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  ant -Ddist.version=cvs
  tar xzvf TuxGuitar-cvs-src.tar.gz
  cd TuxGuitar-cvs-src
  cp $startdir/src/build.properties .
  ant
  install -o root -m 755 -d $startdir/pkg/usr/share/doc/tuxguitar-cvs


  install -D -o root -m 755 tuxguitar $startdir/pkg/usr/bin/tuxguitar
  install -D -o root -m 644 tuxguitar.jar $startdir/pkg/usr/share/java/tuxguitar.jar
  install -D -o root -m 644 -t $startdir/pkg/usr/share/doc/tuxguitar-cvs doc/*
  mkdir -p $startdir/pkg/usr/share/tuxguitar-cvs
  cp -r share/* $startdir/pkg/usr/share/tuxguitar-cvs
}
# vim:syntax=sh
