# Maintainer: Perberos <perberos@gmail.com>
pkgname=libmate
pkgver=20130101
pkgrel=1
pkgdesc="Common libraries for MATE"
url="https://github.com/mate-desktop/libmate"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('ttf-freefont' 'mate-conf')
makedepends=('git' 'mate-doc-utils' 'mate-common' 'mate-corba' 'mate-conf'
             'libmatecomponent' 'mate-mime-data' 'gvfs' 'mate-vfs') #  'libcanberra'
options=('!emptydirs' '!libtool')
groups=('mate')
install=libmate.install

_gitroot=git://github.com/mate-desktop/libmate.git
_gitname=libmate

source=()
sha256sums=()

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # Optional Features:
  #    --enable-esd            Enable ESounD (default=no)
  #    --enable-canberra       Enable canberra (default=yes)
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --libexecdir=/usr/lib/libmate \
    --disable-canberra \
    --disable-schemas-install || return 1

  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"

  make MATECONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1  DESTDIR="$pkgdir" install || return 1

  install -m755 -d "$pkgdir/usr/share/mateconf/schemas"
  mateconf-merge-schema "$pkgdir/usr/share/mateconf/schemas/$pkgname.schemas" --domain $pkgname $pkgdir/etc/mateconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/mateconf/schemas/*.schemas
}
