# Contributor: delphos dragon <delphos.sensei@gmail.com>
pkgname=libam7xxx-git
pkgver=20140508_v0.1.4_13_g2d1f8c1
pkgrel=1
pkgdesc="libam7xxx is an Open Source library to communicate via USB with projectors and Digital Picture Frames based on the Actions Micro AM7XXX family if ICs."
url="http://ao2.it/en/blog/2012/01/18/usb-projectors-linux-and-libam7xxx"
arch=('i686' 'x86_64')
license="GPL2"
depends=('libusb' 'ffmpeg' 'ffmpeg-compat' 'gst-libav' 'usb_modeswitch' 'libxcb')
#optdepends=()
makedepends=('git' 'cmake' 'doxygen')
source=("git://git.ao2.it/libam7xxx.git")
md5sums=('SKIP')


_gitname="libam7xxx"


pkgver() {
    cd "$srcdir/$_gitname"

    echo "$(LANG=C date '+%Y%m%d')_$(git describe --tags --always | sed 's/-/_/g')"
}


build() {
  cd "$srcdir/$_gitname"

  cmake -DCMAKE_INSTALL_PREFIX=/usr 
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
