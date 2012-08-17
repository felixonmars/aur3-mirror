# Maintainer: Vojtech Aschenbrener <v@asch.cz>
pkgname=festvox-czech-ph
pkgver=0.1
pkgrel=1
pkgdesc="Czech diphone database for Festival (Czech adult male voice)."
url="http://www.freebsoft.org/festival-czech-diphone-database"
arch=('any')
license=('GPL')
depends=('festival-czech')
makedepends=()
conflicts=('voice-czech-ph')
replaces=('voice-czech-ph')
backup=()
source=(http://www.freebsoft.org/pub/projects/festival-czech-diphone-database/voice-czech-ph-bin-$pkgver.tar.gz)
md5sums=('7640a284577bcfa600fe931355982fd1')

build() {
    local voice_name=ph
    local voice_dir=czech_$voice_name
    local destdir=$pkgdir/usr/share/festival/voices/czech/$voice_dir

    cd $srcdir/voice-czech-$voice_name-bin-$pkgver
    install -d $destdir
    install -d $destdir/festvox
    install -m 644 festvox/czech_$voice_name.scm $destdir/festvox/
    install -d $destdir/group
    install -m 644 group/$voice_name.group $destdir/group/
}
