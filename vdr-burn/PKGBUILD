# Contributor: Franz Burgmann <f dot burgmann at gmail dot com>

pkgname=vdr-burn
pkgver=0.1.0
pkgrel=2
pkgdesc="VDR-Plugin to create Video-DVDs from Recordings. Resulting DVDs are playable on standalone players."
arch=('i686' 'x86_64')
url="http://www.xeatre.tv/community/burn/"
license=('GPL')
depends=('vdr' 'boost' 'imlib2' 'mjpegtools' 'dvd+rw-tools' 'cdrtools' 'libcdio' 'gd' 'dvdauthor' 'projectx')
makedepends=('vdr')
backup=()
source=(http://linux.kompiliert.net/contrib/vdr-burn-0.1.0-pre21.tgz)
md5sums=()

build() {
  cd $srcdir/burn-$pkgver-pre21
  
  patch -p1 -i ../../01_burn-set-pathes.dpatch
  patch -p1 -i ../../02_projectx.dpatch
  patch -p1 -i ../../03_default-requantizer.dpatch
  patch -p1 -i ../../04_genisoimage.dpatch
  patch -p1 -i ../../10_template.dpatch
  patch -p1 -i ../../90_i18n-fix.dpatch
  patch -p1 -i ../../91_trim-fix.dpatch
  patch -p1 -i ../../92_requantfactor.dpatch
  patch -p1 -i ../../93_burn-0.1.0-pre22_i18n-gettext.dpatch
  patch -p1 -i ../../94_burnfr_FR.dpatch
  patch -p1 -i ../../95_charset-vdr-1.5.3.dpatch
  patch -p1 -i ../../96_gcc4.3-includes.dpatch
  
  make VDRDIR="/usr/src/VDR" LIBDIR="." all || return 1

  mkdir -p $pkgdir/usr/lib/vdr || return 1
  cp libvdr-*.so.* $pkgdir/usr/lib/vdr/ || return 1

  mkdir $pkgdir/usr/share || return 1
  cp -a ../../vdr-plugin-burn $pkgdir/usr/share || return 1
}
