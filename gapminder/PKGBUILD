# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=gapminder
pkgver=0.0.7
pkgrel=1
pkgdesc='desktop version of the gapminder software'
arch=('i686' 'x86_64')
url="http://www.gapminder.org/"
license=('unknown')
depends=('flashplugin' 'xulrunner' 'bash')
source=("http://api.gapminder.org/gapminder-world/packages/default/${pkgver}/gapminder-world-offline-${pkgver}-linux-${CARCH}.tar.bz2" "gapminder")
options=(!strip)

if [ ${CARCH}==x86_64 ]
then
md5sums=('36f16195df29b5d2b514954b575b497a' '811935de04962c2f1d66576d34c9a13c')
else
md5sums=('f8ddeee31ae591be343543b93967c39c' '811935de04962c2f1d66576d34c9a13c')
fi

prepare() {
  msg "automatic generation of desktop file"

	printf "[Desktop Entry]
Version=$pkgver
Type=Application
Name=$pkgname
Comment=$pkgdesc
Exec=/opt/gapminder/run-app.sh
Icon=/opt/gapminder/chrome/icons/default/default128.png
Categories=Science;
Terminal=false
StartupNotify=false" >> gapminder.desktop

}

package() {
  cd $srcdir/

  mkdir -p $pkgdir/opt/gapminder
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/applications

  cp -r gapminder-world-offline-linux-${CARCH}/* $pkgdir/opt/gapminder
  install -m755 gapminder $pkgdir/usr/bin/gapminder
  install -m644 gapminder.desktop $pkgdir/usr/share/applications/
}

