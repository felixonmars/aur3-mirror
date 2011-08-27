# Contributor: vn158 <vn158 at seznam dot cz>
pkgname=installexplorer
pkgver=0.3
pkgrel=1
pkgdesc="Extracts exe archives created by install creators"
arch=(i686 x86_64)
url="http://plugring.farmanager.com/cgi-bin/downld.cgi?Lang=Eng&Select=PlugIn&SelectPlugIn=512&Draw=List"
license=('custom:freeware')
depends=(cmdfar)
makedepends=(unrar)
source=($pkgname http://plugring.farmanager.com/downld/files/instexpl_v0.3.rar)
md5sums=('de349086add8b4f9d6bd5a95ec72a5df' '2979e65a07441a8edaec2cfa0408266e')
noextract=(instexpl_v0.3.rar)
options=(!strip)

build() {
  cd "$startdir"/src

  unrar x -o+ -inul instexpl_v0.3.rar app/

  cd "$startdir"

  install -d -m755 pkg/usr/share/$pkgname

  cp -ra src/app/* pkg/usr/share/$pkgname
  find pkg/usr/share/$pkgname -type d -exec chmod 755 "{}" \;
  find pkg/usr/share/$pkgname -type f -exec chmod 644 "{}" \;

  install -d -m755 pkg/usr/bin
  install -m755 $pkgname pkg/usr/bin
}
