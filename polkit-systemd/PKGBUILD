# $Id: PKGBUILD 158972 2012-05-13 21:06:37Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>
#
#	Custom AUR Package Maintainer: Diogo B. <db_eee.at.hotmail.dot.com>

pkgname=polkit-systemd
pkgver=0.105
pkgrel=1
pkgdesc="Application development toolkit for controlling system-wide privileges. Native systemd support."
arch=(i686 x86_64)
license=('LGPL')
url="http://www.freedesktop.org/wiki/Software/PolicyKit"
depends=('glib2' 'pam' 'expat' 'systemd')
makedepends=('intltool' 'docbook-xsl' 'gobject-introspection')
provides=('polkit=0.105')
replaces=('policykit')
conflicts=('polkit')
options=('!libtool')
source=(http://www.freedesktop.org/software/polkit/releases/polkit-$pkgver.tar.gz
        polkit.pam
	systemd-fallback.patch)
md5sums=('9c29e1b6c214f0bd6f1d4ee303dfaed9'
         '6564f95878297b954f0572bc1610dd15'
         '3c89d97a329ab0ea3a9248c68c3ab000')

build() {
  cd polkit-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib/polkit-1 \
      --disable-static --disable-gtk-doc
  make
}

package() {
  cd polkit-$pkgver
  make DESTDIR="$pkgdir" install

  install -m644 "$srcdir/polkit.pam" "$pkgdir/etc/pam.d/polkit-1"
}
