# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Maintainer: Artem Kulikov <artisho5@gmail.com>

# -Original Maintainer: Eric Belanger <eric@archlinux.org>
# -Original Contributor: Sean Middleditch <elanthis@awesomeplay.com>

pkgname=xscreensaver-arch
_original_pkgname=xscreensaver
pkgver=5.14
pkgrel=1
pkgdesc="Screen saver and locker for the X Window System. Version with replaced art/logos/graphics to better fit to the ArchLinux (Gnome,KDE,XFCE,...). Also adds enchanced desktop icon."
arch=('i686' 'x86_64')
url="http://www.jwz.org/xscreensaver/"
license=('BSD')
depends=('libxxf86vm' 'libglade' 'mesa' 'pam' 'xorg-appres' 'libxmu')
makedepends=('bc')
conflicts=('xscreensaver')
provides=('xscreensaver')
backup=('etc/pam.d/xscreensaver')
source=(http://www.jwz.org/xscreensaver/${_original_pkgname}-${pkgver}.tar.gz \
	add-electricsheep.diff xscreensaver.pam LICENSE
	logo-50.xpm logo-180.xpm logo-50.png logo-180.png)
md5sums=('7777f2a50d6797f9757b6e078a7bea83'
         'f82524626ed8a6832cd279e0548a9b46'
         '367a3538f54db71f108b34cfa31088ac'
         '5e7f3f2a63d20a484742f5b4cb5d572c'
         '3ab3668446f774f3539cf80a6538c188'
         '6c02caa437038fe275bbed7c94f1f982'
         '5c07dfa0c24edf141db09546bd11cc12'
         '04f820ef64a2b9580ad40fa389885133')
sha1sums=('bfa37a9e7b2e93f54922191bb93dbc70c2f73772'
          '65c2933380267475f2c4560bc22f4350393b00ce'
          '106635aa1aae51d6f0668b1853f6c49a4fe9d3d8'
          '4209ea586b204fd1d81c382a0522c654f9fd9134'
          '5ff6dfd0a14ca484d4287647c3e00af8e417163c'
          '63ed187b08864993684f826dc87b1c5f42ea5bf4'
          '203ca4f21e0d42263fc0ebb796eaf968c457d93a'
          '619cff60b77812545493dbedb0ba247a37f381e5')


build() {
	cd "${srcdir}/${_original_pkgname}-${pkgver}"
	patch -Np0 -i "${srcdir}/add-electricsheep.diff"

	cd ${srcdir}
	cp -f logo-180.xpm ${_original_pkgname}-${pkgver}/utils/images/

  cd "${srcdir}/${_original_pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --with-x-app-defaults=/usr/share/X11/app-defaults \
    --with-pam --without-motif --with-gtk --with-gl \
    --without-gle --with-xpm --with-pixbuf --with-jpeg
  #(cd hacks ; make m6502.h)
  #(cd hacks/glx ; make molecules.h)
  make
}

package() {
  cd "${srcdir}/${_original_pkgname}-${pkgver}"
  make install_prefix="${pkgdir}" install
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${_original_pkgname}/LICENSE"
  install -D -m644 ../xscreensaver.pam "${pkgdir}/etc/pam.d/xscreensaver"
  chmod 755 "${pkgdir}/usr/bin/xscreensaver"
  #echo "NotShowIn=KDE;GNOME;" >> "${pkgdir}/usr/share/applications/xscreensaver-properties.desktop"
}
