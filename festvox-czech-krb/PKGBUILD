# Maintainer: Vojtech Aschenbrener <v@asch.cz>
pkgname=festvox-czech-krb
pkgver=1.0.0
pkgrel=1
pkgdesc="Czech diphone database for Festival (Czech child male voice)."
url="http://www.freebsoft.org/festival-czech-diphone-database"
arch=('any')
license=('GPL')
depends=('festival-czech')
makedepends=()
conflicts=()
replaces=()
backup=()
source=(http://www.freebsoft.org/pub/projects/festival-czech-diphone-database/voice-czech-krb-bin-$pkgver.tar.bz2)
md5sums=('0911c97ae5eb82fb83016a5430a1002b')

build() {
    local voice_name=krb
    local voice_dir=czech_$voice_name
    local destdir=$pkgdir/usr/share/festival/voices/czech/$voice_dir

    cd $srcdir/voice-czech-$voice_name-bin-$pkgver
    install -d $destdir
    install -d $destdir/festvox
    install -m 644 festvox/czech_$voice_name.scm $destdir/festvox/
    install -d $destdir/group
    install -m 644 group/$voice_name.group $destdir/group/
}
