# Contributor: vanhtu1987 <vanhtu1987@gmail.com>
pkgname=splashtop
pkgver=2.2.5.0
pkgrel=1
pkgdesc="Remotely access your desktop from any device from anywhere!"
arch=('x86_64' 'i686')
url="http://www.splashtop.com/streamer/linux"
license=('custom')
depends=('python2' 'pywebkitgtk' 'python2-keyring' 'python2-crypto' 'apr' 'apr-util' 'dbus' 'dbus-glib' 'glib2' 'libpulse' 'openssl' 'util-linux' 'libx11' 'libxfixes' 'libxrandr' 'libxtst' 'libappindicator' 'networkmanager')
makedepends=('curl' 'p7zip')
x264_pkgver=libx264-123_0.123.2189+git35cf912-1
if [ "$CARCH" = "x86_64" ]; then
  source=(http://remotedl.splashtop.com/download/Splashtop_Streamer_Ubuntu_1210_v${pkgver}_amd64.deb)
  md5sums=('49f223f9a5fe5aa0a918b4176d0f0cb2')
  x264_ubuntu_deb=http://ubuntu.mirror.cambrium.nl/ubuntu//pool/universe/x/x264/${x264_pkgver}_amd64.deb
  x264_lib_path=./usr/lib/x86_64-linux-gnu/libx264.so.123
else
  source=(http://remotedl.splashtop.com/download/Splashtop_Streamer_Ubuntu_1210_v${pkgver}_i386.deb)
  md5sums=('2fd9dba8f89706ffda3b579a7635d391')
  x264_ubuntu_deb=http://ubuntu.mirror.cambrium.nl/ubuntu//pool/universe/x/x264/${x264_pkgver}_i386.deb
  x264_lib_path=./usr/lib/i386-linux-gnu/libx264.so.123
fi

package ()
{
  msg "Extracting Splashtop package"
  #cd "$srcdir/$pkgname-$pkgver"
  tar -xf $srcdir/data.tar.gz -C $pkgdir
  sed -i 's/python /python2 /' $pkgdir/usr/share/applications/SplashtopStreamer.desktop

  msg "Downloading Ubuntu's pre-compiled x264 library"
  curl -C - $x264_ubuntu_deb > libx264.deb

  msg "Integrating libx264 to package"                                                                                                                                                        
  7z e $srcdir/libx264.deb                                                                                                                                                                    
  tar -xf $srcdir/data.tar $x264_lib_path                                                                                                                                                     
  mkdir -p $pkgdir/usr/lib                                                                                                                                                                    
  mv $x264_lib_path $pkgdir/usr/lib/
}

# vim:set ts=2 sw=2 et:
