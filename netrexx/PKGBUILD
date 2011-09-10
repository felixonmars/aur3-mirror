# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>
pkgname=netrexx
pkgver=3.0
pkgrel=3
pkgdesc="A language inspired by Rexx and Java"
arch=('i686' 'x86_64')
url="http://www.netrexx.org"
license=('ICU')
makedepends=('hd2u')
depends=('jre6' 'jdk6')
provides=('netrexx')
source=('ftp://public.dhe.ibm.com/software/awdtools/netrexx/NetRexx.zip'
        'http://ec2-67-202-36-54.compute-1.amazonaws.com/files/NetRexxC.jar'
        'http://ec2-67-202-36-54.compute-1.amazonaws.com/files/NetRexxR.jar')
noextract=('NetRexxC.jar' 'NetRexxR.jar')
md5sums=('07622f619758b83d593a127f4a2542f1'
         'c3dc18ce0aed0010be8ababf893db606'
         '656c244b4cbfc93b6be572e96a0ed56b')

package() {
  if [ -n "$JAVA_HOME" ]; then
    dstdir=$pkgdir$JAVA_HOME
  else
    dstdir=$pkgdir/opt/java 
  fi
  mkdir -p ${dstdir}/jre/{bin,lib/ext}
  install -m 0755  ${srcdir}/NetRexx/bin/NetRexxC.sh ${dstdir}/jre/bin
  install -m 0755  ${srcdir}/NetRexx/bin/nrc ${dstdir}/jre/bin

  dos2unix ${dstdir}/jre/bin/NetRexxC.sh
  dos2unix ${dstdir}/jre/bin/nrc

  install -m 0755  ${srcdir}/NetRexxC.jar ${dstdir}/jre/lib/ext
  install -m 0755  ${srcdir}/NetRexxR.jar ${dstdir}/jre/lib/ext
}

# vim:set ts=2 sw=2 et:
