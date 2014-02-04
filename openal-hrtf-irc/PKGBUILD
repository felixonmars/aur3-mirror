# Maintainer: Robert Mackanics <schnoopay@gmail.com>
# Contributor: Zach Jaggi <feilen1000@gmail.com>

pkgname=openal-hrtf-irc
pkgver=1.0
pkgrel=1
_oalversion=1.15.1
arch=('any')
license=('LGPL')
pkgdesc="Enable binaural audio globally in 3d applications using IRC HRTF."
depends=('openal>=1.14')
url="https://wiki.archlinux.org/index.php/Gaming"
# Change _ircnum to your desired HRTF. Go to http://recherche.ircam.fr/equipes/salles/listen/sounds.html to pick.
_ircnum="1005"
install=openal-hrtf-irc.install
source=("http://kcat.strangesoft.net/openal-releases/openal-soft-$_oalversion.tar.bz2"
        "ftp://ftp.ircam.fr/pub/IRCAM/equipes/salles/listen/archive/SUBJECTS/IRC_$_ircnum.zip")
noextract=("IRC_$_ircnum.zip")
md5sums=('ea83dec3b9655a27d28e7bc7cae9cd71'
         'SKIP')

prepare() {
    cd $srcdir
    mkdir -p hrtfs
    mkdir -p hrtfs/IRC
    bsdtar -xf IRC_$_ircnum.zip -C hrtfs/IRC
    cp "$srcdir/openal-soft-$_oalversion/utils/IRC_1005.def" "$srcdir/hrtfs/IRC_$_ircnum.def"
    sed -i "s/IRC_1005/IRC_$_ircnum/g" "$srcdir/hrtfs/IRC_$_ircnum.def"
}

build() {
    cd $srcdir/hrtfs
    makehrtf -m -r=32000 -i="$srcdir/hrtfs/IRC_$_ircnum.def" -o=$srcdir/hrtfs/IRC-%r.mhr
    makehrtf -m -r=44100 -i="$srcdir/hrtfs/IRC_$_ircnum.def" -o=$srcdir/hrtfs/IRC-%r.mhr
    makehrtf -m -r=48000 -i="$srcdir/hrtfs/IRC_$_ircnum.def" -o=$srcdir/hrtfs/IRC-%r.mhr
    makehrtf -m -r=96000 -i="$srcdir/hrtfs/IRC_$_ircnum.def" -o=$srcdir/hrtfs/IRC-%r.mhr

}

package() {

  cd $srcdir/hrtfs
    install -m644 -D ./IRC-32000.mhr $pkgdir/usr/share/openal/hrtfs/IRC-32000.mhr
    install -m644 -D ./IRC-44100.mhr $pkgdir/usr/share/openal/hrtfs/IRC-44100.mhr
    install -m644 -D ./IRC-48000.mhr $pkgdir/usr/share/openal/hrtfs/IRC-48000.mhr
    install -m644 -D ./IRC-96000.mhr $pkgdir/usr/share/openal/hrtfs/IRC-96000.mhr

}
