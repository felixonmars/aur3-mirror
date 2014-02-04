# Maintainer: Robert Mackanics <schnoopay@gmail.com>
# Contributor: Zach Jaggi <feilen1000@gmail.com>

pkgname=openal-hrtf-kemar
pkgver=1.0
pkgrel=1
_oalversion=1.15.1
arch=('any')
license=('LGPL')
pkgdesc="Enable binaural audio globally in 3d applications using MIT KEMAR HRTF."
depends=('openal>=1.14')
url="https://wiki.archlinux.org/index.php/Gaming"
install=openal-hrtf-kemar.install
source=("http://kcat.strangesoft.net/openal-releases/openal-soft-$_oalversion.tar.bz2"
        "http://sound.media.mit.edu/resources/KEMAR/full.zip")
noextract=("full.zip")
md5sums=('ea83dec3b9655a27d28e7bc7cae9cd71'
         'deeb987fe17b6231095998e11816305f')

prepare() {
    cd $srcdir
    mkdir -p hrtfs
    mkdir -p hrtfs/MITfull
    bsdtar -xf full.zip -C hrtfs/MITfull
    cp "$srcdir/openal-soft-$_oalversion/utils/MIT_KEMAR.def" "$srcdir/hrtfs/MIT_KEMAR.def"
}

build() {
    cd $srcdir/hrtfs
    makehrtf -m -r=32000 -i="$srcdir/hrtfs/MIT_KEMAR.def" -o=$srcdir/hrtfs/kemar-%r.mhr
    makehrtf -m -r=44100 -i="$srcdir/hrtfs/MIT_KEMAR.def" -o=$srcdir/hrtfs/kemar-%r.mhr
    makehrtf -m -r=48000 -i="$srcdir/hrtfs/MIT_KEMAR.def" -o=$srcdir/hrtfs/kemar-%r.mhr
    makehrtf -m -r=96000 -i="$srcdir/hrtfs/MIT_KEMAR.def" -o=$srcdir/hrtfs/kemar-%r.mhr

}

package() {

  cd $srcdir/hrtfs
    install -m644 -D ./kemar-32000.mhr $pkgdir/usr/share/openal/hrtfs/kemar-32000.mhr
    install -m644 -D ./kemar-44100.mhr $pkgdir/usr/share/openal/hrtfs/kemar-44100.mhr
    install -m644 -D ./kemar-48000.mhr $pkgdir/usr/share/openal/hrtfs/kemar-48000.mhr
    install -m644 -D ./kemar-96000.mhr $pkgdir/usr/share/openal/hrtfs/kemar-96000.mhr

}
