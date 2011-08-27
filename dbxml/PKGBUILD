# Contributor: Francois Charette <firmicus at gmx dot net>

pkgname=dbxml
pkgver=2.3.10
_dbver=4.6.21
pkgrel=3
pkgdesc="The Berkeley DB embeddable XML database with XQuery-based access"
arch=(i686 x86_64)
license=('custom')
url="http://www.oracle.com/technology/products/berkeley-db/xml/index.html"
depends=('db' 'perl' 'xerces-c')
makedepends=('jdk')
options=('!libtool' '!emptydirs')
source=("http://download-uk.oracle.com/berkeley-db/dbxml-$pkgver.tar.gz" \
	"http://download-uk.oracle.com/berkeley-db/db-${_dbver}.tar.gz" \
	'http://www.oracle.com/technology/products/berkeley-db/xml/update/2.3.10/patch.2.3.10.1' \
	'http://www.oracle.com/technology/products/berkeley-db/xml/update/2.3.10/patch.2.3.10.2' \
	'http://www.oracle.com/technology/products/berkeley-db/xml/update/2.3.10/patch.2.3.10.3' \
	'http://www.oracle.com/technology/products/berkeley-db/xml/update/2.3.10/patch.2.3.10.4' \
	'http://www.oracle.com/technology/products/berkeley-db/xml/update/2.3.10/patch.2.3.10.5' \
	'http://www.oracle.com/technology/products/berkeley-db/xml/update/2.3.10/patch.2.3.10.6' \
	'http://www.oracle.com/technology/products/berkeley-db/xml/update/2.3.10/patch.2.3.10.7' \
	'http://www.oracle.com/technology/products/berkeley-db/xml/update/2.3.10/patch.2.3.10.8' \
	'http://www.oracle.com/technology/products/berkeley-db/xml/update/2.3.10/patch.2.3.10.9' \
	'http://www.oracle.com/technology/products/berkeley-db/xml/update/2.3.10/patch.2.3.10.10' \
	'os_clock.patch' 'perlfix.patch')
	
install=(dbxml.install)
md5sums=('7c4ae3239050b111e2263064ed0c86c3'
         '718082e7e35fc48478a2334b0bc4cd11'
         '57abfcf66d70691144980a6108a6ba40'
         'ef53e9562c9df814ced9d7b28383734f'
         '00c68513b80032b74a1956170dc371be'
         'd09fb9af985e99985295a8ca5641d832'
         'de531b5f524db240cbbbd30965dcec05'
         '40152f5bca3871b81b5dc15e6bf42520'
         '4758cb9c985ab3acea5655f474bb6aad'
         'a5d5b0a9eaada76ff12d33a7f4427040'
         '4e78e05338033cdc8a8b37aba6406801'
         '715c28c2b8e79c33e9103c8322e4a99f'
         'd5db85c0b45b13ef761e402428e6872d'
         '2ea05323447c8684f388ab54aae1b475')
build() {
  cd $startdir/src
  echo ">> replacing included db version 4.5.20 by ver 4.6.21"
  rm -rf dbxml-$pkgver/db-4.5.20
  mv db-${_dbver} dbxml-$pkgver/ 
  echo ">> applying upstream patches"
  for i in 1 2 3 4 5 6 7 8 9 10 ; do
	  patch -p0 <patch.$pkgver.$i || return 1
  done
  echo ">> Additional patches"
  patch -p0 < os_clock.patch || return 1
  patch -p0 < perlfix.patch || return 1
  ## the easy way would be:
  #chmod a+x buildall.sh
  #./buildall.sh --prefix=$startdir/pkg/usr --enable-perl
  ## but that would lead to conflict with db and xerces-c pkgs
  ## so instead we do it all by hand
  echo ">> Building (dummy) Berkeley db <<"
  cd $startdir/src/$pkgname-$pkgver/db-${_dbver}/build_unix
  mkdir ../install
  ../dist/configure --prefix=$startdir/src/$pkgname-$pkgver/db-${_dbver}/install \
        --enable-java --enable-cxx || return 1
  make || return 1
  make install || return 1
  ##
  echo ">> Building (dummy) xerces-c libraries <<" 
  XERCESCROOT=$startdir/src/$pkgname-$pkgver/xerces-c-src
  export XERCESCROOT
  XERCES_INSTALL_DIR=$XERCESCROOT/install
  mkdir $XERCES_INSTALL_DIR
  cd $XERCESCROOT/src/xercesc
  ./runConfigure -plinux -b32 -P$XERCES_INSTALL_DIR || return 1
  make || return 1
  make install || return 1
  ##
  echo ">> Building xqilla libraries <<"
  cd $startdir/src/$pkgname-$pkgver/xqilla/
  mkdir build 
  cd build
  ../configure --prefix=$startdir/pkg/usr \
	    --with-xerces=$XERCESCROOT || return 1
  make || return 1
  make install || return 1
  ##
  echo ">> Building dbxml <<"
  cd $startdir/src/$pkgname-$pkgver/dbxml/build_unix
  ../dist/configure --prefix=$startdir/pkg/usr \
        --enable-java \
	--with-xqilla=$startdir/pkg/usr \
	--with-xerces=$XERCES_INSTALL_DIR \
	--with-berkeleydb=$startdir/src/$pkgname-$pkgver/db-${_dbver} \
	--with-dbbuild=../../db-${_dbver} || return 1
  make || return 1
  make install || return 1
  ##
  echo ">> Building perl library <<"
  cd $startdir/src/$pkgname-$pkgver/dbxml/src/perl
# we must change BDB_LIB_PATH and BDB_LIB_INCLUDE to /usr/lib and /usr/include
  sed -e 's|^BDB_LIB_PATH.\+$|BDB_LIB_PATH = /usr/lib|' \
      -e 's|^BDB_INC_PATH.\+$|BDB_INC_PATH = /usr/include|' -i config  
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make MAN1EXT=1p MAN3EXT=3pm || return 1
  make MAN1EXT=1p MAN3EXT=3pm DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '.packlist' -delete
  find $startdir/pkg -name '*.pod' -delete
  ##
  # echo ">> Building python library"
  # cd $startdir/src/$pkgname-$pkgver/dbxml/src/python
  # python setup.py build >> THIS BREAKS!
  # python setup.py install
  ## 
  # PHP bindings: see .../dbxml/src/PHP/README
  ##
  # remove docs
  rm -rf $startdir/pkg/usr/docs
  # install java driver for db
  install -m644 ${startdir}/src/${pkgname}-${pkgver}/db-${_dbver}/install/lib/db.jar ${startdir}/pkg/usr/lib/
  mkdir -p ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 ${startdir}/src/${pkgname}-${pkgver}/dbxml/LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE
  install -m644 ${startdir}/src/${pkgname}-${pkgver}/xqilla/LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE.xqilla
  install -m644 ${startdir}/src/${pkgname}-${pkgver}/xqilla/LICENSE.*.txt ${startdir}/pkg/usr/share/licenses/${pkgname}/
}
