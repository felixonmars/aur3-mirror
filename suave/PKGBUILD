# Contributor: vn158 <vn158 at seznam dot cz>
pkgname=suave
pkgver=2.0
pkgrel=3
pkgdesc="SUAVE: Sport-Utility Assault Vehicle Extreme! Arcade 3rd person shooter."
arch=(i686 x86_64)
url="http://www.blinken.com/suave.php"
license=('custom')
depends=()
[ "$CARCH" = i686   ] && depends=(wine)
[ "$CARCH" = x86_64 ] && depends=(bin32-wine)
makedepends=('innounp' 'icoutils')
source=($pkgname $pkgname.desktop http://www.blinken.com/files/Suave_Installer_20.exe)
md5sums=('82aecbe84da917fce72e1a3f32e15f3f' 'b0310072af5f72072079baab53172e8d' '4274086d09d0d2fdfc457eec177ab986')
noextract=(Suave_Installer_20.exe)
options=(!strip)

build() {
  cd "$startdir"/src
  innounp -x -q Suave_Installer_20.exe

  cd "$startdir"

  wrestool -x -t14 src/\{app\}/SUAVE.exe > suave.ico
  icotool -x suave.ico
  mv suave*png suave.png

  install -d -m755 pkg/usr/share/$pkgname

  cp -ra src/\{app\}/* pkg/usr/share/$pkgname
  find pkg/usr/share/$pkgname -type d -exec chmod 755 "{}" \;
  find pkg/usr/share/$pkgname -type f -exec chmod 644 "{}" \;

  install -d -m755 pkg/usr/bin
  install -m755 $pkgname pkg/usr/bin

  # Install desktop file
  install -D -m644 $pkgname.png $startdir/pkg/usr/share/pixmaps/$pkgname.png
  install -D -m644 $pkgname.desktop $startdir/pkg/usr/share/applications/$pkgname.desktop
}
