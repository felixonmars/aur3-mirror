# Contributor: Eule <die _ eule at gmx dooot net>
pkgname=streamripstar
_realname=StreamRipStar
pkgver=0.6.2
pkgrel=1
pkgdesc="A graphical user interface for streamripper written in Java"
arch=('any')
url="https://github.com/Eule/StreamRipStar"
license=('GPL')
depends=('streamripper' 'java-runtime')
source=(https://github.com/downloads/Eule/${_realname}/${_realname}${pkgver}.jar ${pkgname} ${_realname}-Logo.png ${pkgname}.desktop)
noextract=(${_realname}${pkgver}.jar)
md5sums=('906794b25a3925a0de213d0eb8bccccc'
         '79d135cec6fa48c1d825332a40662d21'
         '1c4398108671563f3b817a92f7b4e007'
         '1e8e7ea5cb405872dbe11e439f2bd6bb')

build() {
  install -D -m 644 ${srcdir}/${_realname}${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}.jar
  install -D -m 644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -D -m 755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -D -m 644 ${srcdir}/${_realname}-Logo.png $pkgdir/usr/share/${pkgname}.png
}
