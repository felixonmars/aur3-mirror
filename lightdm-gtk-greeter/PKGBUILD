# Maintainer: Padfoot <padfoot at exemail dot com dot au>

pkgname=lightdm-gtk-greeter
pkgver=1.5.1
pkgrel=2
pkgdesc="GTK+ greeter for LightDM"
arch=('i686'
      'x86_64')
url="https://launchpad.net/lightdm-gtk-greeter"
license=('GPL3'
         'LGPL3')
depends=('lightdm'
         'gtk3')
makedepends=('gtk-doc'
             'gnome-common'
             'gnome-doc-utils'
             'gobject-introspection'
             'intltool'
             'exo')
conflicts=('lightdm-gtk-greeter-osk'
           'lightdm-gtk-greeter-bzr'
           'lightdm-another-gtk-greeter'
           'lightdm-gtk2-greeter')
replaces=('lightdm-gtk-greeter-osk')
backup=('etc/lightdm/lightdm-gtk-greeter.conf')
install='lightdm-gtk-greeter.install'
source=("https://launchpad.net/$pkgname/1.6/$pkgver/+download/$pkgname-$pkgver.tar.gz"
        "lightdm-gtk-greeter.conf"
        "lightdm-gtk-greeter.patch")
md5sums=('d40b61de2a1585fe6d17af70bc1a752f'
         'c5e90d9ab34136905c84d0d92204efca'
         '6e6b87d983a74f0606f3f5d0c39700a5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export AUTOMAKE=automake
  
  patch -p1 -i $srcdir/lightdm-gtk-greeter.patch
  
  ./autogen.sh --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/lightdm \
    --disable-static
    
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  make DESTDIR="${pkgdir}" install

  cp ../lightdm-gtk-greeter.conf $pkgdir/etc/lightdm
}
