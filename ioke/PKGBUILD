# $Id$
# Contributor: Will Chappell <mr.chapendi@gmail.com>
pkgname=ioke
pkgver=P
_pkgsubver=0.4.0
pkgrel=2
pkgdesc="Ioke is a dynamic prototype-based programming language targeted at the Java Virtual Machine."
arch=(i686 x86_64)
url="http://ioke.org"
license=('custom')
conflicts=(ioke-git)
depends=(java-runtime)
source=("http://ioke.org/dist/${pkgname}-${pkgver}-ikj-${_pkgsubver}.tar.gz" 'ioke.sh')
md5sums=('936fac215d14809ff5f4bd1fd8262ce0'
	         '212beaafccee04c044385d75b175b055')

build() {
  mkdir -p $startdir/pkg/opt/ioke/
  mv $startdir/src/${pkgname} $startdir/pkg/opt/
  install -D -m755 $startdir/src/ioke.sh $startdir/pkg/etc/profile.d/ioke.sh
  rm $startdir/pkg/opt/ioke/bin/*.bat 
}

