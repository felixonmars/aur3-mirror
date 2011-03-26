# Contributor: Bernhard Friedreich <friesoft@gmail.com>

pkgname=qt-symbian
pkgver=4.6.3
pkgrel=3
pkgdesc="Qt for symbian"
url="http://cabledogs.org/abinader/2010/08/18/updated-unofficial-qt-for-symbian-4-6-3-all-in-one-linux-installer-script/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('wine' 'zlib' 'openssl' 'gnupoc')
[ "$CARCH" == "x86_64" ] && depends=('bin32-wine' 'zlib' 'openssl')
install=qt-symbian.install

build() {
  cd $srcdir

   if [ -d downloads ]; then
    cd downloads
  else
    mkdir downloads
    cd downloads
  fi

  wget -c http://get.qt.nokia.com/qt/source/qt-symbian-opensource-4.6.3.exe
  wget -c http://get.qt.nokia.com/qt/solutions/qt-mobility-symbian-opensource-1.0.2.zip
  wget -c -O Nokia_Smart_Installer_for_Symbian_v1_0.zip http://www.forum.nokia.com/piazza/wiki/images/e/e0/Nokia_Smart_Installer_for_Symbian_v1_0.zip?20100624193424
  wget -c http://franciscoalecrim.com/abinader/qt_for_symbian_4.6.3_all_in_one_linux_installer_v3.sh
  wget -c http://martin.st/symbian/gnupoc-package-1.15.tar.gz

  install -d $pkgdir/opt/qt463symbian
  export EPOCROOT=/opt/gnupoc1_15/symbian-sdks/5.0/
  export PATH=$pkgdir/opt/qt463symbian/bin:/opt/gnupoc1_15/bin:$PATH

  chmod +x qt_for_symbian_4.6.3_all_in_one_linux_installer_v3.sh
  ./qt_for_symbian_4.6.3_all_in_one_linux_installer_v3.sh $srcdir/downloads $pkgdir/opt/qt463symbian
}
