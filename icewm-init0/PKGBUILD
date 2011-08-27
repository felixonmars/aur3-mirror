# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: dorphell <dorphell@gmx.net>
# icewm-init0 Maintainer: Zauber Exonar <zauberexonar@gmail.com>

pkgname=icewm-init0
pkgver=1.2.37
pkgrel=3
pkgdesc="The IceWM window manager, with usability patches by Init0"
arch=('i686' 'x86_64')
url="http://init0.nl/icewm.php"
license=('LGPL')
depends=('gcc-libs' 'imlib' 'libxrandr' 'libxft' 'libsm' 'libxinerama' 'giflib')
provides=("icewm")
conflicts=("icewm")
source=(
	http://downloads.sourceforge.net/sourceforge/icewm/icewm-${pkgver}.tar.gz icewm.desktop
	http://init0.nl/icewm-1.2.35-focus_stealing.patch
	http://init0.nl/icewm-1.2.35-flashing.patch
	http://init0.nl/icewm-1.2.35-menu-preload.patch
	http://init0.nl/icewm-1.2.35-mplayer.patch
)
md5sums=('970a21588d26eb361020fd60a61a482c'
         'a3ed467f0199792205b04272402a9945'
         '7ff7c97b6238b68b2df7f275a565bb54'
         'd04e4fa04218f4d5332f2bb733ba44c2'
         'e1e8657408e12471189f71c9eff71939'
         'f28655a7a42b860fe919d6fcecbe8bc5')
sha1sums=('bee1ca66d2282888807551bc28a65b08e4108027'
          '7dcb1f2c89792a35b687182584ed9baa0d34cc80'
          'b7bedbf0201ae5ee2b164fcbe1c88f1dd58fab0c'
          '93ff605a8d3d2327c533ffa260ad4c4066c9f28e'
          '70ed0d6bb7d7e7640379628be551a9f747b36984'
          '78828356ff765f26765086d185ab949bf763ba00')

build() {
   cd "${srcdir}/icewm-${pkgver}"
   patch -p1 -i $srcdir/icewm-1.2.35-focus_stealing.patch
   patch -p1 -i $srcdir/icewm-1.2.35-flashing.patch
   patch -p1 -i $srcdir/icewm-1.2.35-menu-preload.patch
   patch -p1 -i $srcdir/icewm-1.2.35-mplayer.patch
   ./configure --prefix=/usr --sysconfdir=/etc --with-imlib \
     --enable-shaped-decorations --enable-gradients || return 1
   make || return 1
   make DESTDIR="${pkgdir}" install install-man install-docs || return 1
   install -D -m644 "${srcdir}/icewm.desktop" "${pkgdir}/etc/X11/sessions/icewm.desktop" || return 1
}
