# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: farid abdelnour <farid at archlinux-br.org>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Wille Marcel <wille at wille.blog.br>
 
pkgname=sltv
pkgver=0.91
pkgrel=1
pkgdesc='Audio and video streamer that receives streams from several sources (V4L2, Firewire, ALSA, Pulseaudio, files...) and sends a stream using Icecast or to file (Vorbis+Theora)'
arch=('any')
url='http://sltv.holoscopio.com'
license=('GPL')
depends=('pygtk' 'python2-configobj' 'gstreamer0.10-python' 'gstreamer-hplugins' 'gstreamer0.10-bad' 'gstreamer0.10-good' 'gstreamer0.10-ffmpeg' 'python2' 'gstreamer0.10' 'gstreamer0.10-base' )
install="$pkgname.install"
source=("http://sltv.holoscopio.com/$pkgname-$pkgver.tar.gz")
sha256sums=('f2a8aaf884b03a2cdabee52dc271deb11bd7b7f11f1e353d58e2e8d4d5175b79')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i "s_python_&2_" src/sltv.in
}
 
build() {
  cd "$srcdir/$pkgname-$pkgver"
 
  ./configure --prefix=/usr
  make
}
 
package() {
  cd "$srcdir/$pkgname-$pkgver"
 
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
