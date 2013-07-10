# Contributor: vanhtu1987 <vanhtu1987@gmail.com>
pkgname=splashtop-client
pkgver=2.4.0.1
pkgrel=2
_realpkgrel=1
pkgdesc="Remotely access your desktop from any device from anywhere! - Client version"
arch=('x86_64' 'i686')
url="http://www.splashtop.com/streamer/linux"
license=('custom')
depends=('python2' 'pywebkitgtk' 'python2-crypto' 'apr' 'apr-util' 'ffmpeg-compat' 'sdl' 'openssl')
makedepends=('curl' 'p7zip')
if [ "$CARCH" = "x86_64" ]; then
  source=(http://d17kmd0va0f0mp.cloudfront.net/linuxclient/splashtop-client_1204_${pkgver}-${_realpkgrel}_amd64.deb
          splashtop-client)
  md5sums=('411740844213cd879e4b02b27e612fff'
           '514c5d6d7dee7a3bcadce0a582c337be')
else
  source=(http://d17kmd0va0f0mp.cloudfront.net/linuxclient/splashtop-client_1204_${pkgver}-${_realpkgrel}_i386.deb
          splashtop-client)
  md5sums=('e775988a7897b70724b5c3a7a188148b'
           '514c5d6d7dee7a3bcadce0a582c337be')
fi

package ()
{
  msg "Extracting Splashtop package"
  #cd "$srcdir/$pkgname-$pkgver"
  tar -xf $srcdir/data.tar.gz -C $pkgdir
  sed -i 's/python /python2 /' $pkgdir/usr/share/applications/splashtop-client.desktop

  msg "Creating custom executable in /usr/bin"
  mkdir -p $pkgdir/usr/bin
  cp splashtop-client $pkgdir/usr/bin/

  msg "Symlinking compatibility ffmpeg libraries"
  mkdir -p $pkgdir/usr/lib
  ln -s /lib/ffmpeg-compat/libavcodec.so.53 $pkgdir/usr/lib/
  ln -s /lib/ffmpeg-compat/libavformat.so.53 $pkgdir/usr/lib/
  ln -s /lib/ffmpeg-compat/libavutil.so.51 $pkgdir/usr/lib/
}

# vim:set ts=2 sw=2 et:
