# myswiat
pkgname=google-talkplugin-amd64
pkgver=2.5.6.0
pkgrel=2
pkgdesc="Video chat browser plug-in for Google Talk"
arch=('x86_64')
url="http://www.google.com/chat/video"
license=('unknown')
depends=('alsa-utils' 'lib32-alsa-lib' 'lib32-gcc-libs' 'lib32-libstdc++5' 'libstdc++5' 'lib32-glibc' 'fontconfig' 'freetype2' 'libgl' 'glew' 'libpng12'  'lib32-libx11' 'lib32-libxt' 'lib32-openssl' 'lib32-libxfixes' 'lib32-zlib' 'lib32-gtk2' 'lib32-gdk-pixbuf2')
optdepends=('libnotify' 'pulseaudio')
conflicts=('google-talkplugin')
md5sums=('f5b855a9317bf6aad5bf6455d994d58f')

source=(http://dl.google.com/linux/direct/google-talkplugin_current_amd64.deb)

build() {
    msg "Extracting..."
    ar -xv google-talkplugin_current_amd64.deb || return 1
    tar -xvf data.tar.gz || return 1
    msg2 "Done extracting!"
    msg "Moving files"
    mv $srcdir/opt $pkgdir
    mv $srcdir/usr $pkgdir
    msg2 "Done moving files"

}
