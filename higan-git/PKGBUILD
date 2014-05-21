pkgname=higan-git
pkgver=094.10464b8
pkgrel=1
pkgdesc="A Nintendo multi-system emulator formerly known as bsnes"
arch=('i686' 'x86_64')
url=http://byuu.org/higan/
license=(GPL)
replaces=('bsnes')
conflicts=('higan')
makedepend=('libao')
depends=('openal' 'libgl')
optdepends=('alsa' 'pulseaudio' 'sdl')
source=('higan::git+git://gitorious.org/bsnes/bsnes.git'
	'Higan')
install=higan.install
_profiles="accuracy balanced performance"
 
pkgver() {
        cd "higan"
        echo 094.$( git describe --always | sed 's#-#_#g;s#v##' )
}
 
prepare(){
        cd "${srcdir}/higan"
        #Append user's CXXFLAGS and LDFLAGS
        sed -i "/^flags   += -I. -O3 -fomit-frame-pointer/ s/$/ -std=gnu++11 $CXXFLAGS/" Makefile
        sed -i "/^link    +=/ s/$/ $LDFLAGS/" Makefile
}
 
build(){
# libananke
        cd "${srcdir}/higan"
        make compiler=g++ platform=linux flags="$CXXFLAGS -I.. -fomit-frame-pointer -std=gnu++11" -C ananke
 
# higan
        cd "${srcdir}/higan"
        make clean
        for _profile in ${_profiles}; do
                make compiler=g++ platform=linux target=ethos profile=${_profile}
                mv out/higan{,-${_profile}}
        done
}
 
package(){
# Install higan
        cd "${srcdir}/higan"
 
# Common files
        install -dm 755 "${pkgdir}"/usr/{bin,lib,share/{applications,pixmaps,higan/Video\ Shaders}}
        install -m 755 "${srcdir}"/Higan "${pkgdir}"/usr/bin/higan
        install -m 644 "${srcdir}"/higan/data/higan.desktop "${pkgdir}"/usr/share/applications/higan.desktop
        install -m 644 "${srcdir}"/higan/data/higan.png "${pkgdir}"/usr/share/pixmaps/higan.png
        install -m 644 "${srcdir}"/higan/data/higan.ico "${pkgdir}"/usr/share/pixmaps/higan.ico
        cp -dr --no-preserve=ownership profile/* data/cheats.bml "${pkgdir}"/usr/share/higan/
        cp -dr --no-preserve=ownership shaders/*.shader "${pkgdir}"/usr/share/higan/Video\ Shaders/
 
# libananke
        install -m 644 "${srcdir}"/higan/ananke/libananke.so "${pkgdir}"/usr/lib/libananke.so.1
        cd "${pkgdir}"/usr/lib/
        ln -s libananke.so.1 libananke.so
 
# higan
        cd "${srcdir}/higan"
        for _profile in ${_profiles}; do
                install -m 755 {out,"${pkgdir}"/usr/bin}/higan-${_profile}
        done
 
# Fix permissions
        find "${pkgdir}"/usr/share/higan/ -type d -exec chmod 755 {} +
        find "${pkgdir}"/usr/share/higan/ -type f -exec chmod 644 {} +
}
 
md5sums=('SKIP'
	'8f51b56d8584c3f833d51e8e26a0f139')
