# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=kdedecor-reluna
pkgver=0.2
pkgrel=3
pkgdesc="Three comfortable DeKorator window decoration ports."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Reluna+DeKorator?content=102322"
license=('custom')
depends=('kdelibs')
source=(http://www.kde-look.org/CONTENT/content-files/102322-Reluna-DeKorator-$pkgver.tar.gz)
md5sums=('b3f53ff567c80ce7d78773246aea1020')

build() {

mkdir -p $startdir/pkg/usr/share/{apps/deKorator/themes,licenses/kdedecor-reluna}

cd $startdir/src/Reluna-DeKorator-$pkgver
tar xf Reluna-Alunamin-theme.tar.gz || return 1
tar xf Reluna-Bluetiful-theme.tar.gz || return 1
tar xf Reluna-Olove-theme.tar.gz || return 1

cp -r Reluna-Alunamin-theme $startdir/pkg/usr/share/apps/deKorator/themes/
cp -r Reluna-Bluetiful-theme $startdir/pkg/usr/share/apps/deKorator/themes/
cp -r Reluna-Olove-theme $startdir/pkg/usr/share/apps/deKorator/themes/

echo "Message from Shirakawasuna: Bant's given me permission to do this port but retains full rights. If you want to do a derivative work, please get Bant's approval first." > $startdir/pkg/usr/share/licenses/kdedecor-reluna/license
}
