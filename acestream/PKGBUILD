# Contributor: MacCyber <jonas.enge at gmail dot com>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>

pkgname=acestream
pkgver=2.0.0
pkgrel=1
pkgdesc="ACE Stream engine and multimedia player based on VLC"
arch=('i686' 'x86_64')
url="http://acestream.org/"
license=('unknown')
depends=('python2-apsw' 'python2-m2crypto' 'aalib' 'a52dec' 'libass'
         'libavc1394' 'acestream-ffmpeg' 'libcaca' 'libcddb' 'libcdio'
         'libdc1394' 'libdca' 'libdvbpsi' 'libdvdnav' 'libebml' 'faad2' 'gnutls'
         'portaudio' 'qtwebkit' 'libkate' 'lirc-utils' 'lua51' 'libmad'
         'libmatroska' 'libmodplug' 'libmpcdec' 'libmpeg2' 'libmtp' 'libproxy'
         'libraw1394' 'sdl_image' 'libshout' 'smbclient' 'taglib' 'twolame'
         'libupnp' 'vcdimager' 'libxpm' 'ttf-freefont' 'libappindicator')
if [[ "$CARCH" == "i686" ]]; then
  _arch="i386"
  _md5sum='65134cf60f559437bb5d888f13085638'
else
  _arch="amd64"
  _md5sum='3a65410fc4fffb0ab9d4dbb3f1a68b8c'
fi
source=("http://torrentstream.org/downloads/linux/test/${pkgname}-local_${pkgver}_${_arch}.deb")
md5sums=("$_md5sum")

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.gz -C "$pkgdir"

  cd "$pkgdir/usr/lib"

  #create libtinfo symlinks
  #I don't see where they're actually needed, so disabled for now
  #ln -s libncurses.so.5.9 libtinfo.so.5
  #ln -s libncurses.so.5.9 libtinfo.so.5.9
  
  #create liba52 symlink
  ln -s liba52.so.0.0.0 liba52-0.7.4.so

  #create lua5.1 symlink
  ln -s liblua5.1.so liblua5.1.so.0

  # Rename python directory
  mv "$pkgdir/usr/lib/python2.7/dist-packages" \
     "$pkgdir/usr/lib/python2.7/site-packages"

  # Use python2 instead of python3
  sed -i 's/python/python2/g' "$pkgdir/usr/bin/acestreamengine"
}