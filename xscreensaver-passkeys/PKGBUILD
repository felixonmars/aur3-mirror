# Maintainer: Daniel Cocks <daniel DOT cocks AT gmail DOT com>

# Forked from the xscreensaver package at version 5.08-1

_pkgsourcename=xscreensaver
pkgname=${_pkgsourcename}-passkeys
pkgver=5.10
pkgrel=1
pkgdesc="Patched version of xscreensaver to pass keypresses for the electric sheep screen saver."
arch=('i686' 'x86_64')
url="http://www.jwz.org/xscreensaver/"
license=('BSD')
depends=('libxxf86misc' 'libglade' 'mesa' 'pam' 'xorg-res-utils' 'xorg-fonts-type1')
makedepends=('bc')
provides=('xscreensaver')
conflicts=('xscreensaver')
backup=('etc/pam.d/xscreensaver')
source=(http://www.jwz.org/xscreensaver/${_pkgsourcename}-${pkgver}.tar.gz \
	xscreensaver.pam LICENSE \
	xscreensaver-$pkgver-passkeys.patch_.txt)
md5sums=('0d7205f9da8e3f1b83bcda549d73a7c4'
         '367a3538f54db71f108b34cfa31088ac'
         '5e7f3f2a63d20a484742f5b4cb5d572c'
         '17103e975ba61e502fb8f6cd982e6cf1')

build() {
  cd ${srcdir}/${_pkgsourcename}-${pkgver}

  patch -Np1 -i ${srcdir}/xscreensaver-$pkgver-passkeys.patch_.txt || return 1

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
       --libexecdir=/usr/lib \
       --with-x-app-defaults=/usr/share/X11/app-defaults \
       --with-pam --without-motif \
       --with-gtk --without-gnome --with-xml --with-gl \
       --without-gle --with-xpm --with-pixbuf --with-jpeg \
       --with-fortune="/bin/cat /etc/arch-release" || return 1
  make || return 1
  make install_prefix=${pkgdir} install || return 1
  install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
  install -D -m644 ${srcdir}/xscreensaver.pam ${pkgdir}/etc/pam.d/xscreensaver || return 1
  chmod 755 ${pkgdir}/usr/bin/xscreensaver || return 1
  echo "NotShowIn=KDE;GNOME;" >> ${pkgdir}/usr/share/applications/xscreensaver-properties.desktop || return 1
}
