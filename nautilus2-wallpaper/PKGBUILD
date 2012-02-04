# Maintainer: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Alessandro Nakamuta <alessandro dot ufms at gmail dot com>
# Contributor: 3ED <krzysztof1987 at gmail dot com>

pkgname=nautilus2-wallpaper
tarname=nautilus-wallpaper
pkgver=0.1
pkgrel=1
pkgdesc="A nautilus extension to set your desktop wallpaper from the context menu"
url="http://www.gnome.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('nautilus2')
makedepends=('intltool')
options=('!libtool')

source=("${tarname}-0.1.tar.gz"
        "01_add_gconf_pkgconfig.patch"
        "02_move_to_extensions-2.patch"
        "03_fix_doc_prefix.patch"
        "04_add_icon.patch")
md5sums=('e47350626509c85dd9339d0b98900dd6'
         '1b05fa6983061df794c4d462b2d8ed28'
         '7601e33bbf4cff550f0b974f6bc0e062'
         '25569f0797abf01aa6596b7fa37ba8a1'
         '0bc679e2a95c02238d1357cc946dfeab')

build() {
  cd "${srcdir}/${tarname}-${pkgver}"

  patch -Np1 -i ${srcdir}/01_add_gconf_pkgconfig.patch
  patch -Np1 -i ${srcdir}/02_move_to_extensions-2.patch
  patch -Np1 -i ${srcdir}/03_fix_doc_prefix.patch
  patch -Np1 -i ${srcdir}/04_add_icon.patch

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${tarname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

