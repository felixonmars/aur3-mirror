# Contributor: Bruno Aleci <brunoaleci@gmail.com>
_kernver=2.6.24-zen
pkgname=tiacx-zen-svn
pkgver=5
pkgrel=1
pkgdesc="OpenSource module for Texas Instruments ACX100/ACX111 wireless chips."
arch=('i686' 'x86_64')
url="http://acx100.sourceforge.net/"
depends=('wireless_tools' 'kernel26zen-git' 'tiacx-firmware')
makedepends=('subversion')
license=('GPL2')
install=acx.install
source=()
md5sums=()
_svntrunk=https://acx100.svn.sourceforge.net/svnroot/acx100/trunk
_svnmod=acx100


build() {
  cd $startdir/src
  
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
		
  msg "SVN checkout done or server timeout"
  sg "Starting make..."
		    
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  
  patch -Np1 -i ../../acx100_new_kernels.patch
  			
  sed -i "s|acx-obj-y += usb.o|#acx-obj-y += usb.o|g" Makefile
  sed -i "s|#define CONFIG_ACX_USB 1|//#define CONFIG_ACX_USB 1|g" acx_config.h
  make -C /lib/modules/$_kernver/build M=`pwd` CONFIG_ACX=m CONFIG_PCI=y 
  install -D acx.ko $startdir/pkg/lib/modules/$_kernver/extra/acx.ko
  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}

  rm -rf $startdir/src/$_svnmod-build
