# Maintainer: iTwenty <jaydeepmjoshi@gmail.com>

pkgname=transcoder-audio-edition
pkgver=0.0.6
pkgrel=1
pkgdesc="Audio converter for Linux using GTK+ and ffmpeg."
arch=('i686' 'x86_64')
url="http://transcoderae84.sourceforge.net/"
license=('GPL3')
depends=('ffmpeg' 'gtk2')
source=(http://space.dl.sourceforge.net/project/transcoderae84/${pkgver}/TranscoderAudioEdition_${pkgver}.tar.gz)
md5sums=('bf2e7e1b2d883bcc2498b0f7bfd6abcc')

build() {
cd $srcdir/TranscoderAudioEdition*
make
install -Dm755  transcoderaudioedition $pkgdir/usr/bin/transcoderaudioedition
cd data/
sed -i 's_Icon=/usr/local/share/TranscoderAudioEdition/transcoderaudioedition.png_Icon=/usr/share/pixmaps/transcoderaudioedition.png_' transcoderaudioedition.desktop
install -Dm644 transcoderaudioedition.desktop $pkgdir/usr/share/applications/transcoderaudioedition.desktop
install -Dm644 transcoderaudioedition.png $pkgdir/usr/share/pixmaps/transcoderaudioedition.png       
}
