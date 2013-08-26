# Contributor: Michael Pusterhofer <pusterhofer[at]student.tugraz.at>

pkgname=fullrecall
pkgver=1.5.3
pkgrel=1
pkgdesc="Software that can help you memorize the knowledge for lifelong periods with the minimum time investment"
arch=(any)
url="http://fullrecall.com/"
license=('unknown')
depends=('libxext' 'libxrender' 'fontconfig')
source=('http://fullrecall.com/d/fullrecall-linux.bin.bz2'
'fullrecall.desktop'
'fullrecall.png')
md5sums=('30cd4a7f689657403185d37dea26713e'
         'e84dd7389610ffcfe1a1451d228f640a'
         '59bc5f5c1df2f4ffa0fad05147b510ac')


package() {
  chmod +x fullrecall-linux.bin
  install -Dm755 fullrecall-linux.bin $pkgdir/usr/bin/fullrecall
  install -Dm644 fullrecall.desktop $pkgdir/usr/share/applications/fullrecall.desktop
  install -Dm644 fullrecall.png $pkgdir/usr/share/pixmaps/fullrecall.png
}

# vim:set ts=2 sw=2 et:
