pkgname=pidgin-optimize
_realname=pidgin
pkgdesc="Multi-protocol instant messaging client, with msn plus, trayicon transparent, gtalk invisible, gnome-keyring etc. support"
pkgver=2.6.6
pkgrel=1
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
depends=('libsasl' 'dbus-glib' 'nss' 'startup-notification' 'libxss' 'python'
            'hicolor-icon-theme' 'gstreamer0.10-base' 'gnome-keyring')
makedepends=('ca-certificates' 'intltool')
options=('!libtool')
install=pidgin.install
source=(http://downloads.sourceforge.net/${_realname}/${pkgver}/${_realname}-${pkgver}.tar.bz2)


apatch(){
  for i in $startdir/patches/*.patch; do
    msg2 "Add `basename $i`"
    patch -Np1 -i $i || return 1
  done
}

build() {
  cd "$srcdir/$_realname-$pkgver"
  
  apatch || return 1

  glib-gettextize -f
  libtoolize --force
  intltoolize --force --copy --automake
  aclocal $ACLOCAL_FLAGS -I .
  autoheader
  automake -a -c -f
  autoconf

  ./configure --prefix=/usr --sysconfdir=/etc \
    --with-gconf-schema-file-dir=/usr/share/gconf/schemas \
    --with-system-ssl-certs=/etc/ssl/certs \
    --disable-tk --disable-tcl --disable-gtkspell --disable-avahi \
    --disable-doxygen --disable-vv --disable-idn\
    --disable-perl --disable-gnutls --disable-meanwhile --disable-consoleui\
    --enable-cyrus-sasl --enable-gstreamer --enable-nm --enable-gnome-keyring|| return 1
    
  make || return 1
}

package(){
  cd "$srcdir/$_realname-$pkgver"
  make DESTDIR="$pkgdir" install || return 1
   
  cd $pkgdir/usr/share/pixmaps/pidgin/tray
  for i in *;do
    rm -f ${i}/*.ico
    for j in ${i}/*.png;do
      install -Dm644 ${j} $pkgdir/usr/share/icons/hicolor/${i}x${i}/status/pidgin-`basename ${j}`
    done
  done
  cd $OLDPWD
}