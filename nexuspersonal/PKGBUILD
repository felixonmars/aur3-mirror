pkgname=nexuspersonal
pkgver=4.18.0.10751
pkgrel=3
pkgdesc="BankID software for Linux"
url="http://www.bankid.com"
license=('custom')
arch=('i686')
source=('https://install.bankid.com/InstallBankidCom/InstallFiles/personal-4.18.0.10751.tar.gz')
md5sums=('6af3664fac24f1c4e8d185d2a23c7d1c')
depends=('libsm' 'gtk2' 'bash' 'zlib' 'libidn' 'libpng12')
install='nexuspersonal.install'

build() {
    cd $startdir/src/personal-$pkgver

    PKG_DIR="../../pkg"
    INSTALL_DIR="$PKG_DIR/usr/local/lib"
    REAL_INSTALL_DIR="/usr/local/lib"

    mkdir -p $INSTALL_DIR/personal/{config,icons,lang/sv_SE}
    mkdir -p $PKG_DIR/usr/local/bin
    mkdir -p $PKG_DIR/usr/lib/mozilla/plugins
    mkdir -p $PKG_DIR/usr/share/applications

    cp  libai.so\
        libP11.so\
        libplugins.so\
        libtokenapi.so\
        libCardSiemens.so\
        libCardSetec.so\
        libCardPrisma.so\
        personal.bin\
        personal.sh\
        persadm\
        persadm.sh\
		BankID_Security_Application_Help_EN_US.htm\
		BankID_Security_Application_Help_SV_SE.htm\
		BankIDUbuntu_ReadMe_EN_US.txt\
		BankIDUbuntu_ReadMe_SV_SE.txt\
        Release.txt\
        libBranding.so\
        $INSTALL_DIR/personal

    cp Personal.cfg $INSTALL_DIR/personal/config
    cp nexus_logo_32x32.png $INSTALL_DIR/personal/icons 
    cp personal.mo $INSTALL_DIR/personal/lang/sv_SE
    cp personal.desktop $PKG_DIR/usr/share/applications

    ln -s $REAL_INSTALL_DIR/personal/libai.so $INSTALL_DIR/libai.so
    ln -s $REAL_INSTALL_DIR/personal/libtokenapi.so $INSTALL_DIR/libtokenapi.so
    ln -s $REAL_INSTALL_DIR/personal/personal.sh $PKG_DIR/usr/local/bin/personal
    ln -s $REAL_INSTALL_DIR/personal/persadm.sh $PKG_DIR/usr/local/bin/persadm
    ln -s $REAL_INSTALL_DIR/personal/libplugins.so $PKG_DIR/usr/lib/mozilla/plugins/libplugins.so

}
