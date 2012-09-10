# Maintainer: fmoralesc

pkgname=delver
pkgver=latest
pkgrel=4
pkgdesc="A first-person action roguelike"
url=http://www.delvergame.com/
arch=(i686 x86_64)
license=(unknown)
depends=(java-runtime)
source=(delver.desktop
		delver.png
        delver)
md5sums=('acda0b3597b43f64fd34667d9e1c8002'
         'dd8d454ce3f5323ba41a8c84b1bd7ec0'
         '9fcaf92075a75f37a18bf0fdac23f3cb')
install=delver.install

package()
{
  _file=`wget "http://delvergame.com/download.html" -qO /dev/stdout | awk 'BEGIN{ RS="<a *href *= *\""} NR>2 {sub(/".*/,"");print; }' | grep jar`
  msg "Latest version is ${_file}"
  msg "Downloading..."
  wget ""${_file}""
  msg "Extracting..."
  mkdir -p "${pkgdir}"/{usr/{bin,share/applications},opt/delver/}
  mv *.jar "${pkgdir}"/opt/delver/delver.jar  
  install -m755 "${startdir}"/delver "${pkgdir}"/usr/bin/delver
  install -m644 "${startdir}"/delver.png "${pkgdir}"/opt/delver/delver.png
  install -m644 "${startdir}"/delver.desktop "${pkgdir}"/usr/share/applications/
}
