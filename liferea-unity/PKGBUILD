# Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=liferea
pkgname=liferea-unity
pkgver=1.6.7
pkgrel=1
pkgdesc="A desktop news aggregator for online news feeds and weblogs with Unity integration"
arch=('i686' 'x86_64')
url="http://liferea.sourceforge.net/"
license=('GPL')
depends=('gconf' 'libwebkit' 'libglade' 'networkmanager' 'libindicate' 'libunity' 'hicolor-icon-theme')
true && depends=('gconf' 'libwebkit' 'libglade' 'networkmanager' 'libindicate-gtk2' 'libunity' 'hicolor-icon-theme')
makedepends=('pkg-config' 'intltool' 'lua' 'libnotify')
optdepends=('lua: for lua scripting support'
            'libnotify: for notification support')
provides=("liferea=$pkgver")
conflicts=('liferea')
options=('!libtool' '!emptydirs')
install=liferea.install
source=(http://downloads.sourceforge.net/sourceforge/liferea/liferea-${pkgver}.tar.gz
        fix_systray_behavior
        notification-append
        gtk-status-icon.patch
        libindicate.patch
        libunity.patch
        libnotify.patch)
sha1sums=('9ca2d640499dde32cd9fe83b8a6081f3628e5c0c'
          '750c136e796ab51d5cf3c30cdad4e84a0ed1c385'
          'e09a6f93a8c4f41bc5dc37e8542cc701a462ad01'
          'ded7d74fceeef78b6987868a2b16f358dba5d9b3'
          'f29235a23a4f67ed1fef7d304b0a58846eb72ede'
          '500896d29baccead284f194eea999a7c4f94184a'
          '1ec6d093d2b50fc47250600d488314b293272e11')

build() {
  cd "${srcdir}/liferea-${pkgver}"
  patch -Np1 -i "$srcdir/fix_systray_behavior"
  patch -Np1 -i "$srcdir/notification-append"
  patch -Np1 -i "$srcdir/gtk-status-icon.patch"
  patch -Np1 -i "$srcdir/libindicate.patch"
  patch -Np1 -i "$srcdir/libunity.patch"
  patch -Np1 -i "$srcdir/libnotify.patch"

  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-schemas-install
  make
}

package() {
  cd "${srcdir}/liferea-${pkgver}"
  make DESTDIR="${pkgdir}" install
  
  install -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_pkgname}.schemas" "${pkgdir}"/etc/gconf/schemas/*.schemas
  rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas

  mkdir -p "$pkgdir/usr/share/indicators/messages/applications"
  echo '/usr/share/applications/liferea.desktop' > "$pkgdir/usr/share/indicators/messages/applications/liferea"
}
