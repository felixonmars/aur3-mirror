# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Contributer: Eric Belanger <eric@archlinux.org>
# Contributor: actionless <actionless (dot) loveless (at) gmail (dot) com>

pkgname=xscreensaver-federation-logo
pkgver=5.32
pkgrel=1
pkgdesc="Screen saver and locker for the X Window System with Star Trek branding"
arch=('i686' 'x86_64')
url="http://www.jwz.org/xscreensaver/"
license=('BSD')
depends=('libglade' 'libxmu' 'glu' 'xorg-appres' 'perl-libwww')
makedepends=('bc' 'libxpm' )
conflicts=('xscreensaver')
provides=('xscreensaver')
backup=('etc/pam.d/xscreensaver')
source=(http://www.jwz.org/xscreensaver/${pkgname%%-*}-${pkgver}.tar.gz
xscreensaver-add-electricsheep.diff LICENSE
xanalogtv-fix.diff
logo-50.xpm logo-180.xpm)
sha256sums=('4252a6079d2d2f5b342e8bdd172cbad5f0af73daf4e412b61a68344d91ca93bd'
            'c78db4518d1e439811e177638015c7152c5714f13d1cdb32e5d1f53695c52fec'
            '5eb972b5dc6fa01b9de5c529fa4e3cfd4e1fd60eba0159d0821d5d47d1cf2eac'
            '818ae55c122133206b8f7c71d52220902acb318fa521cd9d70fa438c9419a383'
            'abcb0135665a859e38693ccdae43a9fe9796834ad8c056c62dd020727a9201db'
            '78ebfe079047f644f80bc03d4e31f4247c669f427007a96800ef96bfec4058fb')

prepare() {
  cd "${pkgname%%-*}-${pkgver}"
  patch -p0 -i "${srcdir}/xscreensaver-add-electricsheep.diff"
  patch -p0 -i "${srcdir}/xanalogtv-fix.diff"
}

build() {
  cd "${pkgname%%-*}-${pkgver}"
  install -Dm644 "$srcdir"/logo-50.xpm  "${srcdir}"/${pkgname%%-*}-${pkgver}/utils/images/logo-50.xpm
  install -Dm644 "$srcdir"/logo-180.xpm  "${srcdir}"/${pkgname%%-*}-${pkgver}/utils/images/logo-180.xpm
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --with-x-app-defaults=/usr/share/X11/app-defaults 
  make
}

package() {
  cd "${pkgname%%-*}-${pkgver}"
  install -d "${pkgdir}/etc/pam.d"
  make install_prefix="${pkgdir}" install
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname%%-*}/LICENSE"
  chmod 755 "${pkgdir}/usr/bin/xscreensaver"
  echo "NotShowIn=KDE;GNOME;" >> "${pkgdir}/usr/share/applications/xscreensaver-properties.desktop"
}
