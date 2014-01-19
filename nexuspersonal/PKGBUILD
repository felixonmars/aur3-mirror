# Maintainer: TheWaffleGuy <gvxq@hotmail.com>
# Contributor: Gustaf Hallberg <ghallberg@gmail.com>
# Contributor: André Laszlo <andre@laszlo.nu>
# Contributor: whacath <koaxialkabel@gmail.com>
# Contributor: Anders Lindén <anders.linden@gmail.com>

DLAGENTS=('https::/usr/bin/curl -k -fC - --ftp-pasv --retry 3 --retry-delay 3 -o  %o %u')

pkgname=nexuspersonal
pkgver=4.19.1.11663
pkgrel=6
pkgdesc="BankID software for Linux"

url="http://www.bankid.com"
license=('custom')
arch=('i686' 'x86_64')

source=('https://install.bankid.com/Repository/BISP-4.19.1.11663.tar.gz')

md5sums=('9dab1508ac171e56038e920ed5851d44')

depends=('libxt' 'libsm' 'gtk2' 'bash' 'zlib' 'libidn' 'libpng12' 'libgcrypt15')
if test "$CARCH" == x86_64; then
    depends=('lib32-libxt' 'lib32-libsm' 'lib32-gtk2' 'bash' 'lib32-zlib' 'lib32-libidn' 'lib32-libpng12' 'lib32-libgcrypt15')
fi

INSTALL_DIR=/usr/local/lib

package() {
  cd $srcdir/BISP-$pkgver
  echo "srcdir: $srcdir"
  echo "pkgdir: $pkgdir"
  
  mkdir -p $pkgdir/$INSTALL_DIR/{config,icons}
  mkdir -p $pkgdir/usr/local/bin
  mkdir -p $pkgdir/usr/lib/mozilla/plugins
  mkdir -p $pkgdir/usr/share/applications
  
  for l in da_DK fi_FI nn_NO sv_SE; do
    mkdir -p $pkgdir/$INSTALL_DIR/personal/lang/$l
    cp ../lang/$l/personal.mo $pkgdir/$INSTALL_DIR/personal/lang/$l/
    chmod 644 $pkgdir/$INSTALL_DIR/personal/lang/$l/personal.mo
  done
  
  cp libP11.so\
     libplugins.so\
     libCardSiemens.so\
     libCardSetec.so\
     libCardPrisma.so\
     libCardEdb.so\
     libCardGTOClsc.so\
     personal.bin\
     personal.sh\
     persadm\
     persadm.sh\
     BankID_Security_Application_Help_EN_US.htm\
     BankID_Security_Application_Help_da_DK.htm\
     BankID_Security_Application_Help_fi_FI.htm\
     BankID_Security_Application_Help_no_NO.htm\
     BankID_Security_Application_Help_SV_SE.htm\
     BankIDUbuntu_ReadMe_EN_US.txt\
     BankIDUbuntu_ReadMe_da_DK.txt\
     BankIDUbuntu_ReadMe_fi_FI.txt\
     BankIDUbuntu_ReadMe_no_NO.txt\
     BankIDUbuntu_ReadMe_SV_SE.txt\
     Release.txt\
     libBranding.so\
     $pkgdir/$INSTALL_DIR/personal
     
  cp libai.so\
     libtokenapi.so\
     $pkgdir/usr/lib
     
  cp Personal.cfg $pkgdir/$INSTALL_DIR/personal/config
  cp nexus_logo_32x32.png $pkgdir/$INSTALL_DIR/personal/icons
  cp personal.desktop $pkgdir/usr/share/applications

  ln -s $INSTALL_DIR/personal/personal.sh $pkgdir/usr/local/bin/personal
  ln -s $INSTALL_DIR/personal/persadm.sh $pkgdir/usr/local/bin/persadm
  ln -s $INSTALL_DIR/personal/libplugins.so $pkgdir/usr/lib/mozilla/plugins/libplugins.so

}
