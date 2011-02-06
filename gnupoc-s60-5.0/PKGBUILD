# Contributor: Bernhard Friedreich <friesoft@gmail.com>

pkgname=gnupoc-s60-5.0
pkgver=1.15
pkgrel=2
pkgdesc="S60 SDK 5th Edition (needed for Qt for Symbian)"
url="http://cabledogs.org/abinader/2010/08/18/updated-unofficial-qt-for-symbian-4-6-3-all-in-one-linux-installer-script/"
license=('GPL')
provides=('gnupoc')
arch=('i686' 'x86_64')
depends=('wine' 'zlib' 'openssl')
[ "$CARCH" == "x86_64" ] && depends=('bin32-wine' 'zlib' 'openssl')
install=gnupoc-s60-5.0.install

build() {
  cd $srcdir

   if [ -d downloads ]; then
    cd downloads
  else
    mkdir downloads
    cd downloads
  fi

  wget -c -O S60_5th_Edition_SDK_v1_0_en.zip http://sw.nokia.com/id/577ad48d-290c-4bb5-8bdf-779ea8a5bc6c/S60_5th_Edition_SDK_v1_0_en.zip
  wget -c -O s60_open_c_cpp_plug_in_v1_6_en.zip http://qdrive.net/index.php/page-file_share-choice-download_file-id_file-161544-ce-0
  wget -c http://www.codesourcery.com/public/gnu_toolchain/arm-none-symbianelf/gnu-csl-arm-2005Q1C-arm-none-symbianelf-i686-pc-linux-gnu.tar.bz2
  wget -c http://martin.st/symbian/gnupoc-package-1.15.tar.gz
  wget -c http://franciscoalecrim.com/lizardo/gnupoc_1.15_installer_v2.sh

  install -d $pkgdir/opt/gnupoc1_15
  chmod +x gnupoc_1.15_installer_v2.sh
  ./gnupoc_1.15_installer_v2.sh $srcdir/downloads $pkgdir/opt/gnupoc1_15 5.0
  chown -R 755 $pkgdir/opt/gnupoc1_15 
}
