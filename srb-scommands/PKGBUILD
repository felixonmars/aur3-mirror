# Maintainer: Pierre Chapuis <catwell at archlinux dot us>

# IMPORTANT NOTE: This package doesn't depend on the Globus toolkit because
# there is no working Globus package available as of now, but you *need* to
# have Globus installed and to set its location below before running makepkg.

_globus_location=/usr/share/globus

pkgname=srb-scommands
pkgver=3.4.2
pkgrel=2
pkgdesc='Storage Resource Broker client utilities for Unix'
arch=('i686' 'x86_64')
url='http://www.sdsc.edu/srb/index.php/Scommands'
license=('custom')
depends=('openssl') # because GSI security is enabled
source=('http://www.sdsc.edu/srb/tarfiles/SRB3_4_2client.tar')
md5sums=('cb42947abbabd7677ef4c960fc2ce2be')

build() {

  # fix getline conflict
  cd $srcdir/SRB3_4_2/utilities/src/
  for i in sputw getsrbobj sgetw; do
    sed -i 's/getline/LOC_getline/' $i.c
  done

  cd $srcdir/SRB3_4_2

  # fix for Globus 4
  sed -i -e 's/-lssl_$(GSI_INSTALL_TYPE)/-lssl/' \
         -e 's/-lcrypto_$(GSI_INSTALL_TYPE)/-lcrypto/' \
          mk/mk.config.in

  # build
  ./configure --enable-gsi-auth \
              --enable-globus-location=$_globus_location \
              --enable-openssl-location="/usr/"
  make

  # install license
  for i in edu gov; do
    install -Dm0644 COPYRIGHT/Copyright.$i \
     $pkgdir/usr/share/licenses/$pkgname/LICENSE.$i.txt
  done

  # install binaries
  cd utilities/bin
  for i in {S*,srbp*,getsrbobj}; do
    install -Dm0755 $i $pkgdir/usr/bin/$i
  done

}
