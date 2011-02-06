# Contributor: rickyc85
pkgname=pixmaip4200
pkgver=2.60
pkgrel=1
pkgdesc="A wrapper to Canon driver for Pixma iP4200 printer"
url="http://www.canon.it/"
depends=('rpmextract' 'libxml2')
source=(http://it.software.canon-europe.com/files/soft24302/software/iP4200_Linux_260.tar.gz)
md5sums=('d0e21f27c3978f1b58885fc910e07847')
build() {
    gzip -d iP4200_Linux_260.tar.gz
    tar -xvf iP4200_Linux_260.tar
    rpmextract.sh cnijfilter-common-2.60-1.i386.rpm
    rpmextract.sh cnijfilter-ip4200-2.60-1.i386.rpm
    rpmextract.sh cnijfilter-ip4200-lprng-2.60-1.i386.rpm
    mkdir -p $startdir/pkg/usr/lib
    cp -a usr/lib/* $startdir/pkg/usr/lib
    mkdir -p $startdir/pkg/usr/share
    cp -a usr/share/* $startdir/pkg/usr/share
    mkdir -p $startdir/pkg/usr/bin
    cp -a usr/local/bin/* $startdir/pkg/usr/bin
    cp -a usr/local/share/* $startdir/pkg/usr/share
    echo -e '[Desktop Entry]\nVersion=2.60\nType=Application\nName=Canon iP4200 Status Monitor\nName[it]=Canon iP4200 Status Monitor\nGenericName=Canon iP4200 Status Monitor\nComment=View device status and ink levels.\nComment[it]=Visualizza lo stato della periferica ed il livello di inchiostro.\nExec=/usr/bin/cngpijmon\nIcon=print-manager\nTerminal=false\nCategories=Application;Utility;\nX-KDE-StartupNotify=false\nStartupNotify=false\n' > ip4200.desktop
    mkdir -p $startdir/pkg/usr/share/applications
    cp -a ip4200.desktop $startdir/pkg/usr/share/applications
}
