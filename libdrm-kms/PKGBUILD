# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=libdrm-kms
pkgver=20090410
pkgrel=2
pkgdesc="Modesetting capable libdrm"
arch=(i686 x86_64)
license=('MIT')
depends=('glibc' 'kernel26-kms')
makedepends=('git' 'kernel-headers-kms')
provides=('libdrm=2.4.4')
replaces=('libdrm')
options=('!libtool' 'force')
url="http://tirdc.livejournal.com/"
source=('no-pthread-stubs.patch')
md5sums=('68e785f3602f09bbe56a00ecc5d6fd9c')

_gitroot="git://anongit.freedesktop.org/mesa/drm"
_gitname="drm"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    msg2 "Fetching sources..."
    cd $_gitname
    git checkout --track -b modesetting-gem origin/modesetting-gem
  fi

  msg2 "Preparing..."
  rm -rf $srcdir/$_gitname-build
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  msg2 "Starting make..."

  msg2 "add patch..."
  patch -Np1 -i "${srcdir}/no-pthread-stubs.patch"
  ./autogen.sh --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
