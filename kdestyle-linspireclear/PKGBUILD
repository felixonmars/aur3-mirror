# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=kdestyle-linspireclear
pkgver=1.11
pkgrel=1
pkgdesc="KDE 3.4.x Window Decoration and Style from Linspire Five-0"
url="http://www.kde-look.org/content/show.php?content=23620"
license="GPL"
depends=('kdebase')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://software.linspire.com/pool-src/los/los-linspireclear-style/los-linspireclear-style_${pkgver}-0.0.0.50.linspire0.1.tar.gz automake_patch.diff)
md5sums=(1e2cc6f0febf17b294d8306ccce8db51 07327936d7897360124876a08571a024)

build() {
        cd $startdir/src/marlin_build_los-linspireclear-style-1
        patch -p1 < $startdir/src/automake_patch.diff
        make -f admin/Makefile.common
        ./configure --disable-debug --prefix=/opt/kde
        make || return 1
        make DESTDIR=$startdir/pkg install
}

