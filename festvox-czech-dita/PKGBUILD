# Maintainer: Vojtech Aschenbrener <v@asch.cz>
pkgname=festvox-czech-dita
pkgver=1.0.0
pkgrel=1
pkgdesc="Czech diphone database for Festival (Czech adult female voice)."
url="http://www.freebsoft.org/festival-czech-diphone-database"
arch=('any')
license=('GPL')
depends=('festival-czech')
makedepends=()
conflicts=()
replaces=()
backup=()
source=(http://www.freebsoft.org/pub/projects/festival-czech-diphone-database/voice-czech-dita-bin-$pkgver.tar.bz2)
md5sums=('f6fe0f5f80435d814feab087439c2c76')

build() {
    local voice_name=dita
    local voice_dir=czech_$voice_name
    local destdir=$pkgdir/usr/share/festival/voices/czech/$voice_dir

    cd $srcdir/voice-czech-$voice_name-bin-$pkgver
    install -d $destdir
    install -d $destdir/festvox
    install -m 644 festvox/czech_$voice_name.scm $destdir/festvox/
    install -d $destdir/group
    install -m 644 group/$voice_name.group $destdir/group/
}
