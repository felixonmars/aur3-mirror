#maintainer: jarryson <jarryson@gmail.com>

pkgname=xmms2tray
pkgver=0.5.1
pkgrel=3
pkgdesc="XMMS2tray is a small XMMS 2 client that displays an icon in system tray with a popup menu and notifications via libnotify and notification-daemon."
arch=('i686' 'x86_64')
url="http://code.jollybox.de/pub/xmms2tray"
license=('GPL')
groups=('lh')
depends=('xmms2>=0.6DrMattDestruction' 'pygtk' 'python-notify' 'python-imaging')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
source=(http://code.jollybox.de/pub/xmms2tray/$pkgname-$pkgver.tar.gz \
        $pkgname.desktop zh_CN.po
        images.tar.xz
        xmms2traymod.patch)
noextract=()
md5sums=('78afec675baa55607fe7f970bb37b797'
         'a798705f31cdedea14bbf35523bb75bc'
         '13f2a9a4a86d9c4bf9124f81c6899fca'
         '90178bceb0076d1704fa839a05827d59'
         '031a048554410b2eb50aa95db39135f4')

build() {
  cd $srcdir/$pkgname-$pkgver
  
  for i in $startdir/patches/*.patch; do
    patch -Np1 -i $i
  done
  patch -Np1 -i $srcdir/xmms2traymod.patch || return 1

  cp ../zh_CN.po $srcdir/$pkgname-$pkgver/data/po/zh_CN.po ||return 1
  cp -r $srcdir/images $srcdir/$pkgname-$pkgver/images
  python setup.py install --prefix=/usr --root=$pkgdir

  install -Dm644 ${srcdir}/$pkgname.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 ${srcdir}/$pkgname.desktop ${pkgdir}/etc/xdg/autostart/${pkgname}.desktop
}

