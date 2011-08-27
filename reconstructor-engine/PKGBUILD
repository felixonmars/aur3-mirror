# Contributor: Gareth R <newtackdesign@gmail.com>
pkgname=reconstructor-engine
pkgver=3.2.3
pkgrel=1
pkgdesc="A customisation kit for Debian based systems."
arch=('i686' 'x86_64')
url="https://www.reconstructor.org"
license=('GPL')
depends=('python' 'cdrkit' 'squashfs-tools' 'syslinux' 'rsync' 'psmisc' 'multipath-tools' 'parted' 'dosfstools' 'mbr' 'pygtk' 'sudo')
source=("https://www.reconstructor.org/attachments/download/28/"$pkgname"_"$pkgver".tar.gz"
		"reconstructor.sh"
		"reconstructor.desktop")
md5sums=('0cc7598fdbc81b8d3db5c4481f1fa1dc'
         'e45a10989cffac17f68b12d03b848c31'
         '2ce9647b986a5cf4dea8eb20b21a164a')

build() {
  cd "$srcdir"
  cp "$srcdir/reconstructor/ui/icon.png" "$srcdir/reconstructor.png"
  install -m 755 -D "$srcdir/reconstructor.png" "$pkgdir/usr/share/pixmaps/reconstructor.png"
  install -m 755 -D "$srcdir/reconstructor.desktop" "$pkgdir/usr/share/applications/reconstructor.desktop"
  install -m 755 -D "$srcdir/reconstructor.sh" "$pkgdir/usr/bin/reconstructor"
  mkdir -p "$pkgdir/usr/share/reconstructor"
  cp -R "$srcdir/reconstructor" "$pkgdir/usr/share"
}

# vim:set ts=2 sw=2 et:
