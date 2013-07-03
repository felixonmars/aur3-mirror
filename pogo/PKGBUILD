# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=pogo
pkgver=0.8.2
pkgrel=1
pkgdesc="Probably the simplest and fastest audio player for Linux"
arch=('any')
url="https://launchpad.net/pogo/"
license=('GPL')
depends=('pygtk' 'python2-dbus' 'mutagen' 'python2-imaging'
         'gstreamer0.10-python' 'desktop-file-utils')
optdepends=('python2-notify: notifications support'
            'gnome-setting-daemon: gnome media keys'
            'gstreamer0.10-ugly-plugins: MP3 support')
install="$pkgname.install"
source=("${url}trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz")
md5sums=('af9daa5060f41c2559f884632e11c63d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # python2 fix
  sed -i "s/python/&2/" "$pkgdir/usr/bin/pogo"
}

# vim:set ts=2 sw=2 et:
