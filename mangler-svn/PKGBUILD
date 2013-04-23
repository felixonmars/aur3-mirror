# Contributor: kalio

pkgname=mangler-svn
_svnname=mangler
pkgver=1183
pkgrel=2
pkgdesc="Ventrilo-compatible VOIP client for Linux - possibly unstable"
arch=('i686' 'x86_64')
url="http://www.mangler.org/"
license=('GPLv3')
depends=('gtkmm' 'librsvg' 'gsm' 'speex')
makedepends=('subversion')
optdepends=('alsa-lib: ALSA support'
            'oss: OSS support'
            'pulseaudio: PulseAudio support'
            'celt: CELT codec support'
            'espeak: TTS support'
            'xosd: Information overlay support'
            'dbus-glib: Rhythmbox/Amarok integration')
provides=('mangler')
conflicts=('mangler' 'mangler-git')
source=('mangler::svn+http://svn.mangler.org/mangler/trunk/')
md5sums=(SKIP)

pkgver() {
    cd "$SRCDEST/$_svnname"
    svnversion | tr -d [A-z]
}

build() {
    cd "$srcdir/$_svnname"
    touch configure
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_svnname"
    make DESTDIR=${pkgdir} install
}
