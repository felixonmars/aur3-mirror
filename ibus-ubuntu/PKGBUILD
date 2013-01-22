# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Rainy <rainylau(at)gmail(dot)com>
# Contributor: Lee.MaRS <leemars at gmail dot com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=ibus-ubuntu
_ubuntu_rel=0ubuntu1
pkgver=1.4.2.${_ubuntu_rel}
pkgrel=1
pkgdesc='Next Generation Input Bus for Linux.'
arch=('i686' 'x86_64')
license=('LGPL')
url='http://ibus.googlecode.com'
depends=('python2-dbus' 'gconf' 'dconf' 'python2-xdg' 'iso-codes' 'librsvg' 'python2-notify' 'hicolor-icon-theme')
optdepends=('notification-daemon')
makedepends=('intltool')
provides=("ibus=${pkgver}")
conflicts=('ibus')
options=('!libtool')
install=ibus.install
source=("http://ibus.googlecode.com/files/${pkgname%-*}-${pkgver%.*}.tar.gz"
        "http://archive.ubuntu.com/ubuntu/pool/main/i/${pkgname%-*}/${pkgname%-*}_${pkgver%.*}-${_ubuntu_rel}.debian.tar.gz")
sha512sums=('0070f7d0a4bc6510692851f60e06e487f75fdbe47f50a2371f62dd06b89f20950161b5f1bb91e025dd8dced654d9e90eb910bb5be8e8923869e96e5048f8316d'
            '0ae69e90cbe69fdf90011abff7207bf853b68dba7c3538440d3d688026c0a51c542a210e35fab415b135fe51ef716f45fd1a822268cbc6ee27aab28dccdde05c')

build() {
  cd "${pkgname%-*}-${pkgver%.*}"

  # Apply Ubuntu's patches
    # Don't need other patches
      patch -Np1 -i "${srcdir}/debian/patches/02_title_update.patch"
      patch -Np1 -i "${srcdir}/debian/patches/05_appindicator.patch"

  #for i in $(grep -v '#' "${srcdir}/debian/patches/series"); do
  #  patch -Np1 -i "${srcdir}/debian/patches/${i}"
  #done

  # Cannot find gmodule-2.0
  #CFLAGS="${CFLAGS} $(pkg-config --libs gmodule-2.0)"

  # Fix FTBFS on some systems
  sed -i 's|--pkg=ibus-1.0|--pkg-export=ibus-1.0|' src/Makefile.in

  export PYTHON=python2

  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/${pkgname%-*} \
    --sysconfdir=/etc \
    --with-gconf-schema-file-dir=/usr/share/gconf/schemas \
    --enable-gtk3 \
    --enable-surrounding-text # From debian/rules

  make ${MAKEFLAGS}
}

package() {
  cd "${pkgname%-*}-${pkgver%.*}"

  make DESTDIR="${pkgdir}/" install

  install -dm755 "${pkgdir}/etc/xdg/autostart/"
  ln -s /usr/share/applications/ibus.desktop "${pkgdir}/etc/xdg/autostart/"
}

# vim:set ts=2 sw=2 et:
