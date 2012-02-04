# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=gstreamer0.10-rtmp
pkgver=0.10.20
pkgrel=3
pkgdesc="GStreamer plug-in for rtmp streams"
arch=('i686' 'x86_64')
url="http://rpmfind.net//linux/RPM/mandriva/devel/cooker/x86_64/media/contrib/release/gstreamer0.10-rtmp-0.10.20-3mdv2011.0.x86_64.html"
license=('GPL2')
depends=('gstreamer0.10-base-git' 'rtmpdump')

if [ "${CARCH}" = 'x86_64' ]; then
  source=(ftp://fr2.rpmfind.net/linux/Mandriva/devel/cooker/x86_64/media/contrib/release/$pkgname-$pkgver-${pkgrel}mdv2011.0.x86_64.rpm)
  md5sums=('3999af856385948bdb51a8fabd2431b1')
elif  [ "${CARCH}" = 'i686' ]; then 
  source=(ftp://fr2.rpmfind.net/linux/Mandriva/devel/cooker/i586/media/contrib/release/$pkgname-$pkgver-${pkgrel}mdv2011.0.i586.rpm)
  md5sums=('93f813babbd8aac93f32647d4090f4d2')
fi

build() {
   cd $srcdir

   mkdir -p $pkgdir/usr/lib/gstreamer-0.10
   bsdtar xf $pkgname*

if [ "${CARCH}" = 'x86_64' ]; then
   mv $srcdir/usr/lib64/gstreamer-0.10/libgstrtmp.so $pkgdir/usr/lib/gstreamer-0.10
elif  [ "${CARCH}" = 'i686' ]; then 
   mv $srcdir/usr/lib/gstreamer-0.10/libgstrtmp.so $pkgdir/usr/lib/gstreamer-0.10
fi 
}