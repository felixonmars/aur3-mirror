# Maintainer: Perberos <perberos@gmail.com>
pkgname=mate-vfs
pkgver=20130101
pkgrel=1
pkgdesc="The MATE Virtual File System"
url="https://github.com/mate-desktop/mate-vfs"
arch=(i686 x86_64)
license=('LGPL')
depends=('mate-conf' 'bzip2' 'smbclient' 'mate-mime-data') #  'krb5' 'avahi' 'gnutls' 'fam'
makedepends=('pkgconfig' 'intltool' 'gtk-doc' 'mate-common')
options=('!emptydirs' '!libtool')
groups=('mate')
install=mate-vfs.install
source=()
sha256sums=()

_gitroot=git://github.com/mate-desktop/mate-vfs.git
_gitname=mate-vfs

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

  #Fix build with new gnutls
  #patch -Np1 -i "${srcdir}/gnutls-config.patch"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --libexecdir=/usr/lib/${pkgname} \
    --disable-samba \
    --disable-hal \
    --disable-avahi \
    --disable-howl \
    --disable-openssl || return 1
    #--disable-openssl --enable-gnutls
  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  
  make MATECONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -d -m755 "${pkgdir}/usr/share/mateconf/schemas"
  mateconf-merge-schema "${pkgdir}/usr/share/mateconf/schemas/${pkgname}.schemas" --domain ${pkgname} ${pkgdir}/etc/mateconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/mateconf/schemas/*.schemas
}
