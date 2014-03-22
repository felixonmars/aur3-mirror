pkgname=winff-svn
pkgver=r819
pkgrel=1
epoch=1
pkgdesc='WinFF is a GUI to the command line video converter FFmpeg'
arch=('i686' 'x86_64')
url='http://code.google.com/p/winff/'
license=('GPL3')
depends=('ffmpeg' 'gtk2' 'xterm' 'hicolor-icon-theme')
makedepends=('svn' 'lazarus' 'lazarus-gtk2' 'gendesk')
source=('winff::svn+http://winff.googlecode.com/svn/trunk/')
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

#prepare() {
#  gendesk -n \
#    --pkgname "$pkgname" \
#    --pkgdesc "$pkgdesc" \
#    --genericname 'Video converter' \
#    --categories 'AudioVideo;AudioVideoEditing;GTK'
#}

build() {
  cd "${pkgname%-*}/winff"

  lazbuild --lazarusdir=/usr/lib/lazarus winff.lpr --ws=gtk2
}

package() {
  cd "${pkgname%-*}/winff"

  install -Dm755 "winff" "$pkgdir/usr/bin/$pkgname"
  install -d "$pkgdir/usr/share/winff/"
  find . -name "*.xml" \
    -exec install -Dm644 {} "$pkgdir/usr/share/winff/" \; &> /dev/null
#  install -Dm644 "../winff.desktop" \
#    "$pkgdir/usr/share/applications/winff.desktop"
  install -Dm644 "../winff-debian-packaging/winff.desktop" \
    "$pkgdir/usr/share/applications/winff.desktop"
  install -Dm644 'winff-icons/48x48/winff.png' \
    "$pkgdir/usr/share/pixmaps/winff.png"
  for size in 16x16 24x24 32x32 48x48; do
    install -Dm644 "winff-icons/$size/winff.png" \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/winff.png"
  done
  install -dm755 "$pkgdir/usr/share/winff/languages/"
  find . -name "*.po" -exec install -Dm644 {} "$pkgdir/usr/share/winff/languages/" \; &> /dev/null
  rm -f 'presets.xml'


#  install -Dm 755 $srcdir/$_svnmod-build/winff $pkgdir/usr/bin/winff
#  install -dm 755 ${pkgdir}/usr/share/winff/
#  find . -name "*.xml" -exec install -Dm 644 {} ${pkgdir}/usr/share/winff/ \; &> /dev/null
#  install -Dm 644 $srcdir/$_svnmod-build/debian/winff.desktop $pkgdir/usr/share/applications/winff.desktop
#  install -Dm 644 $srcdir/$_svnmod-build/debian/winff.xpm $pkgdir/usr/share/pixmaps/winff.xpm
}
