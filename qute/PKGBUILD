# Maintainer: TDY <tdy@gmx.com>

pkgname=qute
pkgver=0.4.1
pkgrel=1
pkgdesc="A text editor with Markdown and TeX support"
arch=('i686' 'x86_64')
url="http://www.inkcode.net/qute"
license=('GPL')
install=qute.desktop
source=(https://github.com/downloads/fbreuer/qute-html5/Qute-$pkgver-linux.tar.gz
        qute.sh qute.desktop)
md5sums=('7a3a756285bb0c59d89e440e428b22e5'
         'fecc8fbff2f440cf6d6464162b1572a3'
         '8a72545254dee76520331f5297437638')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/opt"
  cp -a Qute "$pkgdir/opt/qute"

  # enforce perms
  find -type f -exec chmod 644 '{}' \;
  find -type d -exec chmod 755 '{}' \;
  chmod 755 $(find "$pkgdir" -exec file '{}' \;|grep ELF|cut -d: -f1)

  install -Dm644 Qute/README.md "$pkgdir/usr/share/docs/qute/README.md"
  install -Dm644 Qute/qute.png "$pkgdir/usr/share/pixmaps/qute.png"
  install -Dm644 qute.desktop "$pkgdir/usr/share/applications/qute.desktop"
  install -Dm755 qute.sh "$pkgdir/usr/bin/qute"
}

# vim:set ts=2 sw=2 et:
