# Contributor: PR <predrg@gmail.com>

pkgname=gst-plugin-anaglyph-git
pkgver=20110624
pkgrel=1
pkgdesc="Combine two image streams into a 3D anaglyph stream"
arch=("i686" "x86_64")
url="https://github.com/michaelgruner/gst-plugin-anaglyph"
license=('BSD')
depends=('gstreamer0.10' 'gstreamer0.10-base-plugins')
makedepends=('git')
provides=('gst-plugin-anaglyph')

_gitroot="https://github.com/michaelgruner/gst-plugin-anaglyph"
_gitname="gst-plugin-anaglyph"

source=(commit-a7f4acf)
md5sums=('4a9b914d283352bd5b88324683ad47cd')

build() {
  cd $srcdir

  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_gitname-build
  cp -r $_gitname $_gitname-build
  cd $_gitname-build

  for p in ../../commit-*; do patch -N -p1 < $p; done

  autoreconf --verbose --force --install
  ./configure --prefix=/usr
  make
}

package(){
  cd $srcdir/$_gitname-build
  make DESTDIR=$pkgdir install
  rm $pkgdir/usr/lib/gstreamer-0.10/*.la
}
