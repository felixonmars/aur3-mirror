pkgname=xfce4-session-ubuntu
_pkgname=xfce4-session
pkgver=4.8.1
_patchver=4.8.1
pkgrel=1
pkgdesc="A session manager for Xfce, with hibernate and suspend buttons and ubuntu patches"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=("libxfcegui4>=4.6.4" 'libwnck' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'perlxml' 'xorg-server-utils' 'intltool')
optdepends=('fortune-mod:       for xfce4-tips')
replaces=('xfce4-toys' 'xfce4-session')
conflicts=('xfce4-session')
provides=('xfce4-session')
options=('!libtool')
install=${pkgname}.install
source=(http://archive.xfce.org/src/xfce/${_pkgname}/4.8/${_pkgname}-${pkgver}.tar.bz2
        http://archive.ubuntu.com/ubuntu/pool/universe/x/${_pkgname}/${_pkgname}_${_patchver}-1ubuntu2.debian.tar.gz)
md5sums=('478080ff666fdd36786a243829663efd'
         'bc81422be591d2c0c4d4981479a401d3')

build() {
  cd $srcdir/${_pkgname}-$pkgver
  mv $srcdir/debian $srcdir/${_pkgname}-$pkgver

  for i in `ls ../xfce4-session-${_patchver}/debian/patches/*.patch* | sort`; do
    patch -p1 -s -i $i
    if [ $? = 0 ]; then
      echo "$i applied"
    else
      echo "Error processing $i"
      return 1
    fi
  done

  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static \
    --enable-legacy-sm --disable-gnome --enable-session-screenshots \
    --with-shutdown-style=auto
  make
  make DESTDIR=$pkgdir install
}
