# Contributor: linfocito <dududa@gmail.com>
pkgname=desktop2app
pkgver=0.1.4
pkgrel=1
pkgdesc="Creates a Rox AppDir wrapper from a .desktop file"
url="http://www.kerofin.demon.co.uk/rox/desktop2app.html"
license="GPL"
depends=('rox-lib' 'rox')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.kerofin.demon.co.uk/rox/Desktop2App-$pkgver.tar.gz)
md5sums=(caa420c0933625a5f2c3a50b8a2d8f03)

build() {
  cd $startdir/src/Desktop2App
  rm -rf Help
  mkdir -p $startdir/pkg/usr/share
  mkdir -p $startdir/pkg/usr/bin
  cd ..
  cp -R Desktop2App  $startdir/pkg/usr/share
  echo "#!/bin/sh" > $startdir/pkg/usr/bin/desktop2app
  echo "exec /usr/share/Desktop2App/AppRun \"\$@\"" >> $startdir/pkg/usr/bin/desktop2app
  chmod +x $startdir/pkg/usr/bin/desktop2app
}
