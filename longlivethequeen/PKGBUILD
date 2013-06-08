# Maintainer: Joost Bremmer <toost dot b at gmail dot com>
pkgname=longlivethequeen
pkgver=1.1.4
pkgrel=1
pkgdesc="visual novel RPG by Hanako Games"
arch=('x86_64')
url="http://http://www.hanakogames.com/llq.shtml"
license=('custom:commercial')
depends=('python2')
makedepends=('desktop-file-utils')
install=longlivethequeen.install
source=('longlivethequeen.desktop'
        'longlivethequeen.png')
sha256sums=('97438d0fdd1418b9414a8600c2c31c859a5896507550f9e0046a1f4f9eeffd33'
            '3b90b863685a91246b97bc875fd5a6d905d572bce4d6bd3a86f25795aee9d046')

_gamepkg="LongLiveTheQueenRetail-${pkgver}-linux-x86.tar.bz2"
_gamesha256="4a5c40b72c59a8889194c5c4ecb11d020d4b8b1fc856d8cd42c4038a1883821b"

prepare() {

  cd ${srcdir}
  msg "You need a full copy of this game in order to install it"
  msg "Download the .tar.gz version of the game and give its path below"
  msg "Searching for \"${_gamepkg}\" in dir: $(readlink -f ${startdir})"
  pkgpath="${startdir}/${_gamepkg}"

  if [[ ! ( -f "${startdir}/${_gamepkg}" ) ]]; then
     error "Game file not found, please type path to game setup package:"
     read pkgpath
     if [[ ! ( "${pkgpath:0:1}" == "/" ) ]]; then
        pkgpath="${startdir}/${pkgpath}"
     fi
     if [[ ! ( -f "${pkgpath}" ) ]] ; then
        error "Unable to find game file." && return 1
     fi
  fi

  if [[ ! (`sha256sum ${pkgpath} | cut -f1 -d' '` == "${_gamesha256}") ]]; then
     error "Game file seems to be a different version, problems may occur!"
  fi
  msg "Found game file, installing..."


}

build() {
        cd ${srcdir}
        msg "Extracting gamepackage"
	ln -fs "${pkgpath}"
	mkdir -p "${pkgname}"
        tar --strip-components=1 -jxvf "${_gamepkg}" -C "${pkgname}"
        mv "${pkgname}/LongLiveTheQueen.sh" "${pkgname}/LongLiveTheQueen"
}

package() {
        cd ${srcdir}
#        install -dvm644 "${srcdir}/${pkgname}" "${pkgdir}/opt/hanako/${pkgname}"
        find . -type d -exec install -dv {,${pkgdir}/opt/hanako/}{} \;
        find . -type f -perm 644 -exec install -Dv -m 644 {,${pkgdir}/opt/hanako/}{} \;
        find . -type f -perm 755 -exec install -Dv -m 755 {,${pkgdir}/opt/hanako/}{} \;


	install -Dvm644  "${srcdir}/longlivethequeen.png" "${pkgdir}/opt/hanako/${pkgname}/icon.png"
        install -Dvm644  "${srcdir}/longlivethequeen.desktop" "${pkgdir}/usr/share/applications/longlivethequeen.desktop"

	install -Dvm644 "${srcdir}/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
