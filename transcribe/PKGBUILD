# Maintainer: Giacomo Ritucci (giacomo.ritucci % gmail.com) 
pkgname=transcribe
pkgver=8.40
pkgrel=1
pkgdesc="Program used to help transcribe recorded music"
arch=('i686' 'x86_64')
url="http://www.seventhstring.com/"
license=('non-free')
if [ "$CARCH" = "i686" ]; then
    depends=('gstreamer0.10' 'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins' 'gstreamer0.10-ffmpeg' 'libpng12')
elif [ "$CARCH" = "x86_64" ]; then
    depends=('gstreamer0.10' 'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins' 'gstreamer0.10-ffmpeg' 'libpng12')
fi
provides=('transcribe')

[ "$CARCH" = "i686" ] && source=("http://www.seventhstring.com/xscribe/downlinux/xscsetup.tar.gz")
[ "$CARCH" = "i686" ] && md5sums=("06db3475e36287878326d4c7405795a5")

[ "$CARCH" = "x86_64" ] && source=("http://www.seventhstring.com/xscribe/downlinux64/xsc64setup.tar.gz")
[ "$CARCH" = "x86_64" ] && md5sums=("5d9d27313b9b4797a85442506c75c116")

package() {
  cd "$srcdir/$pkgname"
  mkdir $pkgdir/{usr,usr/bin}
  cp transcribe "$pkgdir/usr/bin/"
}
