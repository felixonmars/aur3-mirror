# $Id: PKGBUILD 199343 2013-11-11 15:17:24Z foutrelis $
# Maintainer: Alad Wenter 
# base64 -d <<< YWxhZEBhcmNobGludXguaW5mbwo=
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=exo-helpers-patch
_pkgname=exo
pkgver=0.10.2
pkgrel=1
pkgdesc="Extensions to Xfce by os-cillation"
arch=('i686' 'x86_64')
url="https://bugzilla.xfce.org/show_bug.cgi?id=10731"
license=('GPL2' 'LGPL')
groups=('xfce4')
depends=('libxfce4ui' 'gtk2' 'hicolor-icon-theme' )
makedepends=('perl-uri' 'intltool' 'gtk-doc' 'xorg-iceauth')
optdepends=('perl-uri: for mail-compose helper script')
conflicts=('exo')
provides=('exo')
install=$_pkgname.install
source=(http://archive.xfce.org/src/xfce/$_pkgname/0.10/$_pkgname-$pkgver.tar.bz2
	0001-Fix-exo_str_looks_like_an_uri-bug-10098.patch
	0002-helpers.patch)
sha256sums=('b385828bf8a38204da3254b57fdfa25a72694495aa189fabd5040f707eec76ce'
            'f3a92ea399c5786845d3c3a9d74a427299ecd5ed7e5ef2ac1cf636492050e247'
            'b0e6fef04d644c863b9823227be1271879e14e93dae216c443819af19da5b923')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  # https://bugzilla.xfce.org/show_bug.cgi?id=10098
  patch -Np1 -i "$srcdir/0001-Fix-exo_str_looks_like_an_uri-bug-10098.patch"
  # https://bugzilla.xfce.org/show_bug.cgi?id=10731
  patch -Np1 -i "$srcdir/0002-helpers.patch"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Python 2 fix
  export PYTHON=python2

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var  \
    --disable-static \
    --enable-gtk-doc \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
