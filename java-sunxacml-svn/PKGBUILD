# Maintainer: Sven Schober <sschober (at) sssm (dot) de>
pkgname=java-sunxacml-svn
pkgver=2.0
pkgrel=1
pkgdesc="Sun's XACML Implementation is an access control policy
evaluation engine"
url="http://sunxacml.sourceforge.net/"
arch=("i686" "x86_64")
depends=('j2re' 'java-xalan')
license=('custom')
source=('ant-build-file-xalan-dependeny.patch')
_svnroot=https://sunxacml.svn.sourceforge.net/svnroot/sunxacml/trunk
_svnname=xacml
md5sums=('adaeac599229e664beeb1ffd4d333f25')
build() {
  cd $srcdir

  if [[ -d $_svnname ]]; then
    cd $_svnname && svn revert sunxacml/build.xml && svn up && cd ..
  else
    svn co $_svnroot $_svnname
  fi

  cd $_svnname
  patch -Np1 -i ${srcdir}/ant-build-file-xalan-dependeny.patch || return 1

  # build and install: sunxacml.jar
  cd sunxacml
  ant jar || return 1
  mkdir -p $startdir/pkg/usr/share/java/sunxacml
  cp build/lib/*.jar $startdir/pkg/usr/share/java/sunxacml

  # install: license.txt
  mkdir -p $startdir/pkg/usr/share/license/sunxacml
  cp license.txt $startdir/pkg/usr/share/license/sunxacml

  # build and install: support.jar
  cd ../support/src
  ant jar || return 1
  cp build/lib/*.jar $startdir/pkg/usr/share/java/sunxacml

}
