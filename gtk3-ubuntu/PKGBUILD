# Maintainer: 
# Contributors: Det, Charles Bos, Xiao-Long Chen, Christopher Reimer, Que Quotion
# Based on gtk3 trunk: https://projects.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/gtk3

pkgname=gtk3-ubuntu
pkgver=3.14.6
_debrel=0ubuntu1
pkgrel=2
pkgdesc="GObject-based multi-platform toolkit (v3) from Ubuntu"
arch=(i686 x86_64)
url="https://launchpad.net/ubuntu/+source/gtk+3.0/"
install=gtk3-ubuntu.install
depends=(adwaita-icon-theme atk at-spi2-atk cairo colord 
         gtk-update-icon-cache pango shared-mime-info wayland 
         lib{cups,xcursor,xinerama,xrandr,xi,xcomposite,xdamage,xkbcommon})
makedepends=(gobject-introspection python2)
provides=(gtk3{,-ubuntu}=$pkgver)
conflicts=(gtk3)
license=(LGPL)
source=(http://ftp.gnome.org/pub/gnome/sources/gtk+/${pkgver:0:4}/gtk+-$pkgver.tar.xz
        https://launchpad.net/ubuntu/+archive/primary/+files/gtk+3.0_$pkgver-$_debrel.debian.tar.xz
        settings.ini)
sha256sums=('cfc424e6e10ffeb34a33762aeb77905c3ed938f0b4006ddb7e880aad234ef119'
            'dc405f72d675d44a6a7e77a894636c8d5bbcf14e07b64739b1398e0caafec816'
            '14369dfd1d325c393e17c105d5d5cc5501663277bd4047ea04a50abb3cfbd119')

prepare() {
  cd "gtk+-$pkgver"

  #Apply Ubuntu patches
  while read i; do
    if [[ "${i}" =~ ^# || -z "${i}" ]]; then
      continue # Skip comments and newlines
    else
      msg "Applying ${i} ..."
      patch -Nsp1 < "${srcdir}/debian/patches/${i}"
    fi
  done < "${srcdir}/debian/patches/series"

}

build() {
    cd "gtk+-$pkgver"

    msg2 "Running autoreconf..."
    autoreconf -vfi

    msg2 "Running ./configure..."
    CXX=/bin/false ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-gtk2-dependency \
        --disable-schemas-compile \
        --enable-{x11,broadway,wayland}-backend

    #https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    msg2 "Running make..."
    make
}

package() {
    cd "gtk+-$pkgver"
    msg2 "Running make install..."
    make DESTDIR="$pkgdir" install
    install -Dm644 ../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"
}
