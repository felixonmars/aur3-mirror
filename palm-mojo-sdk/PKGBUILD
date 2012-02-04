# Maintainer: Chuck Atkins <chuckatkins at gmail dot com>

pkgname=palm-mojo-sdk
pkgver=1.3.1
pkgrel=2
pkgdesc="Palm Mojo Softare Development Kit for the webOS platform."
arch=(i686 x86_64)
url="http://developer.palm.com"
license=('custom')
groups=('devel')
if [ "$CARCH" == "x86_64" ]; then
  depends=('java-environment=6' 'virtualbox>=3' 'lib32-libusb' )
else
  depends=('java-environment=6' 'virtualbox>=3' 'libusb' )
fi
makedepends=('deb2targz')

source=(https://cdn.downloads.palm.com/sdkdownloads/1.3.1.314/sdkBinaries/palm-sdk_1.3.1-svn222348-sdk100-pho314_i386.deb
        https://cdn.downloads.palm.com/sdkdownloads/1.3.1.314/sdkBinaries/palm-novacom_1.0.46_i386.deb
        novacomd)
noextract=(palm-sdk_1.3.1-svn222348-sdk100-pho314_i386.deb
           palm-novacom_1.0.46_i386.deb)
md5sums=('697a9c304992f5e7440c64b1c8634bb2'
         '1f860bc8d3cecdfda5d35babc5513676'
         '85a2fda1e7a4a34e9072f5c7263c8672')
sha1sums=('ffdbc37e7ad885d362669a7951a9bccdacbf3a7d'
          'a882790b9f30f7544a9e77bb8dd66fbbd97ce2c8'
          '8bf3291710f3f22b8c4a36263f1b8f5b1a0dab92')
sha256sums=('8dbf678ac9aa6cc339ac38c313622a3cc99fd6f4231ccbcdeef7f7d516cceb24'
            '82a16d48d30de84f7787488c0d1f60a7aa09f6b6386507f5dff9be885da90749'
            'ab58d139768ad1fc357c7d7747b7b7376ca13968d66cf208701a7c7a74bca756')
sha384sums=('d4118e8e455f4724495a696020ccb233ac74a69d0c7bd7a7dcc5343fe13ae9b1ed99a19abc9c328ddce1077c3213f034'
            '9c0eb17a501738d8fb954dea1e83cc486cc2ccd97309c36ecba5ad3951568e8d7ff97efbd730aefcb514a96948ee7d42'
            'e05ec6c7e6feb18dde0269c5265d28ba3db525cdf1b3d94820203844fe90447830891b9397e96301c2ef15622e49d725')
sha512sums=('7f1b1537830182b86acce19abdf749efa91a5f1253f3940c4110d2aa0ceb620bbbbb1678da22ff8c18b305fdb7b84dd2849f3b38dc5e453432605e461232512f'
            '151af764d8fcba9c38603b68c8b55e0885718201d46d891b18fa9a95628b5d94cd124ef2c72ac02216093d4d91ec6d7cbee8535928b779db9b0c76bdd6503afb'
            '96ff9594ac774b8bcaa8987555efdbeab888db6db4434a9ea035f55e1601429128339d35a02b0468b74198d6951e208171f3a8f6ecf3a85b085231baca4e4b69')

build() {
  cd $srcdir
  deb2targz palm-novacom_1.0.46_i386.deb
  deb2targz palm-sdk_1.3.1-svn222348-sdk100-pho314_i386.deb

  cd $pkgdir
  tar -xf $srcdir/palm-novacom_1.0.46_i386.tar.gz
  tar -xf $srcdir/palm-sdk_1.3.1-svn222348-sdk100-pho314_i386.tar.gz
  install -D $srcdir/novacomd $pkgdir/etc/rc.d/novacomd

  mv $pkgdir/usr/local/* $pkgdir/usr
  rm -r $pkgdir/usr/local

  rm $srcdir/palm-novacom_1.0.46_i386.tar.gz
  rm $srcdir/palm-sdk_1.3.1-svn222348-sdk100-pho314_i386.tar.gz
}

