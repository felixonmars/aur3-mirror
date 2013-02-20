# Maintainer: M4rQu1Nh0S <zonadomarquinhos@gmail.com>
pkgname=libnautilus-burn
pkgver=2.25.3
pkgrel=1
pkgdesc="Lets you burn CDs and DVDs easily with GNOME, by drag-and-dropping files in the GNOME file manager"
arch=('i686' 'x86_64')
url="https://launchpad.net/ubuntu/lucid/i386/libnautilus-burn4"
license=('GPL')
depends=('hal' 'gtk2')
optdepends=('gnome-mount')
source=("http://launchpadlibrarian.net/40388287/${pkgname}4_$pkgver-0ubuntu4_i386.deb")
md5sums=('569fdbbcc04f872f797a79b822f8c9e0')

build() {
echo "unpacking deb"
  ar x ${pkgname}4_$pkgver-0ubuntu4_i386.deb;
  cd $startdir/src;
echo "unpacking binary"
  tar xzf data.tar.gz -C $startdir/pkg
}

# vim:set ts=2 sw=2 et:
