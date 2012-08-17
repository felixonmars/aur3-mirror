# Maintainer: Vojtech Aschenbrener <v@asch.cz>
pkgname=festvox-czech-machac
pkgver=1.0.0
pkgrel=1
pkgdesc="Czech diphone database for Festival (Czech adult male voice)."
url="http://www.freebsoft.org/festival-czech-diphone-database"
arch=('any')
license=('GPL')
depends=('festival-czech')
makedepends=()
conflicts=()
replaces=()
backup=()
source=(http://www.freebsoft.org/pub/projects/festival-czech-diphone-database/voice-czech-machac-bin-$pkgver.tar.bz2)
md5sums=('ed2c4e26ab15aafe9621141c1568cd89')

build() {
    local voice_name=machac
    local voice_dir=czech_$voice_name
    local destdir=$pkgdir/usr/share/festival/voices/czech/$voice_dir

    cd $srcdir/voice-czech-$voice_name-bin-$pkgver
    install -d $destdir
    install -d $destdir/festvox
    install -m 644 festvox/czech_$voice_name.scm $destdir/festvox/
    install -d $destdir/group
    install -m 644 group/$voice_name.group $destdir/group/
}
