# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=xix-music-player
pkgver=0.39a
pkgrel=3
pkgdesc="Multi-platform music player."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/xixmusicplayer/"
license=('GPL3')
depends=('gtk2' 'libbass_aac' 'libbass_alac' 'libbass_ape' 'libbass_fx' 'libbasscd' 'libbassdsd' 'libbassflac' 'libbassopus' 'libpulse')

# If you want the Qt4 version uncomment next line. Default is GTK2. Also change dependency from gtk2 -> qt4.
#_de='QT'

if [ "$CARCH" == "x86_64" ] && [ "$_de" == '' ]; then
  _pkgarch='_x64'
  _md5sum='77504294d287aa7bd1c40de8c47959b2'
fi
if [ "$CARCH" == "x86_64" ] && [ "$_de" == 'QT' ]; then
  _pkgarch='_x64'
  _md5sum='bdebba8793bf44f97b16eb6c846af68c'
fi
if [ "$CARCH" == "i686" ] && [ "$_de" == '' ]; then
  _md5sum='ade46dc75e08186eb956be30eb84152b'
fi
if [ "$CARCH" == "i686" ] && [ "$_de" == 'QT' ]; then
  _md5sum='f5f9938ed0f1907b30373313cf8fc871'
fi
source=(http://sourceforge.net/projects/xixmusicplayer/files/Linux/XiXMusicPlayer${_de}${_pkgarch}.zip
        $pkgname
        XiX-Music-Player.desktop
        XiX-Music-Player.ico)
md5sums=($_md5sum
         'a9dc33519ca6426d574054404dafe6b0'
         'e6855b7d4b2efaecadef8038ca3b4831'
         '6e4ec1161919499307b244c5e7dee693')
optdepends=('fbcmd: Facebook integration in XiX Music Player'
            'lame: encode CD-Tracks to MP3'
            'flac: encode CD-Tracks to FLAC'
            'mplayer: to rip DVD-Tracks')

package() {
  cd $srcdir/XiXMusicPlayer*

  # Binary
  install -Dm755 XiXMusicPlayer* $pkgdir/usr/share/XiX-Music-Player/XiXMusicPlayer

  # Data
  cp -r Local/ plugins/ $pkgdir/usr/share/XiX-Music-Player

  # Start file
  cd ..
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname

  # Desktop icon
  install -Dm644 XiX-Music-Player.desktop $pkgdir/usr/share/applications/XiX-Music-Player.desktop
  install -Dm644 XiX-Music-Player.ico $pkgdir/usr/share/pixmaps/XiX-Music-Player.ico
}