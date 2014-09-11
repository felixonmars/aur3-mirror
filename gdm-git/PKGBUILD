# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=gdm
pkgname=$_pkgname-git
pkgver=3.13.91
pkgrel=1
_realver=3.13.91
pkgdesc="Gnome Display Manager"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org"
options=('!libtool')
groups=('gnome')
depends=('gnome-shell' 'gnome-session' 'xorg-xrdb' 'xorg-server' 'systemd')
makedepends=('git' 'itstool' 'intltool' 'gnome-doc-utils' 'gobject-introspection')
optdepends=('fprintd: fingerprint authentication')
install=gdm.install
replaces=('gdm' 'libgdm')
provides=("gdm=$_realver" "libgdm=$_realver")
conflicts=('gdm' 'libgdm')
backup=('etc/pam.d/gdm-launch-environment'
        'etc/pam.d/gdm-password' 'etc/pam.d/gdm-smartcard' 'etc/gdm/custom.conf'
        'etc/gdm/Xsession')
source=('git://git.gnome.org/gdm'
        '0001-Fix-external-program-directories.patch')
sha256sums=('SKIP'
            '48c39634197efe2970d273de373aed63aa9b1f716210cd6d111ea0dbaaf8ec46')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -Np1 -i "$srcdir/0001-Fix-external-program-directories.patch"
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/gdm \
    --localstatedir=/var \
    --disable-static \
    --disable-schemas-compile \
    --with-at-spi-registryd-directory=/usr/lib/at-spi2-core \
    --with-check-accelerated-directory=/usr/lib/gnome-session \
    --with-authentication-agent-directory=/usr/lib/polkit-gnome \
    --without-tcp-wrappers \
    --without-console-kit \
    --with-systemd \
    --with-default-pam-config=exherbo

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install

  chmod 1770 "$pkgdir/var/log/gdm"
  #chmod 700 "$pkgdir/var/lib/gdm/.config/dconf"
  # rm -r "$pkgdir/var/run" "$pkgdir/var/gdm"
}
