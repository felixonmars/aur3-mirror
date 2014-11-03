# Maintainer: Darexon <cren331 aT gmailDOTcom>

_pkgbase=sox
pkgname=$_pkgbase-git
pkgver=14.4.1.r173.g6e75b15
pkgrel=4
pkgdesc="The Swiss Army knife of sound processing tools (Development version with all optional libraries)"
arch=('i686' 'x86_64')
url="http://sox.sourceforge.net/Main/HomePage"
license=('GPL' 'LGPL2')
depends=('flac' 'libpng' 'ladspa' 'libltdl' 'libvorbis' 'libsndfile'
         'gsm' 'opencore-amr' 'lame' 'opusfile' 'twolame' 'libmad'
         'libid3tag' 'wavpack')
makedepends=('git')
optdepends=(
    'alsa-lib: for alsa plugin'
    'libao: for ao plugin'
    'libpulse: for pulse plugin')
provides=('sox')
conflicts=('sox')
source=(git://sox.git.sourceforge.net/gitroot/sox/sox)
md5sums=('SKIP')

pkgver() {
    cd $_pkgbase
    git describe --long --tags | sed -r 's/^sox.//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd $_pkgbase
    autoreconf -i
    ./configure --with-distro='Arch Linux' --prefix=/usr \
    --enable-dl-lame --enable-dl-mad --enable-dl-sndfile \
    --enable-dl-amrnb --enable-dl-amrwb --enable-dl-twolame
    make
}

package() {
    cd "$_pkgbase"
    make DESTDIR="$pkgdir/" install
    echo -e "\e[0;31mNOTE: You will need to recompile to get plugin support from optional
    dependencies if they weren't already installed when you compiled.\e[0m"
}
