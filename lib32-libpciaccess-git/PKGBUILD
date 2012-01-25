_pkgbasename=libpciaccess
pkgname=lib32-${_pkgbasename}-git
pkgver=20120125
pkgrel=1
pkgdesc='X11 PCI access library (32-bit)'
arch=('i686' 'x86_64')
license=('custom')
url='http://xorg.freedesktop.org/'
depends=('lib32-glibc' ${_pkgbasename})
makedepends=('gcc-multilib' 'pkgconfig' 'xorg-util-macros')
options=('!libtool')
provides=('lib32-libpciaccess=99')
replaces=('lib32-libpciaccess')
conflicts=('lib32-libpciaccess')
_gitroot=git://anongit.freedesktop.org/xorg/lib/${_pkgbasename}
_gitname=${_pkgbasename}

build() {
  msg "Connecting to anongit.freedesktop.org GIT server...."

  if [ -d $_gitname ] ; then
     cd $_gitname && git pull origin && cd ..
     msg "The local files are updated."
  else
     git clone --depth 1 $_gitroot
  fi
  msg "GIT checkout done or server timeout"

  msg "Starting make..."
  cd $_gitname

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
    --libdir=/usr/lib32
  make

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/include
  #whatever
  #mkdir -p "$pkgdir/usr/share/licenses"
  #ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
