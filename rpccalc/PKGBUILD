# Maintainer: DonVla <donvla@users.sourceforge.net>

pkgname=rpccalc
pkgver=0.1.2
pkgrel=1
pkgdesc="A console version of rpCalc - a simple reverse polish notation calculator"
arch=("i686" "x86_64")
url="http://www.bellz.org/rpccalc/index.html"
license=('GPL')
depends=("ncurses" "python2")
source=("http://www.bellz.org/${pkgname}/${pkgname}-${pkgver}.tar.gz" "rpccalc")
md5sums=('38e4fc1c55d497be0e60ba0b912343cc'
         '02869baf2b73c408cb70d212b994d2f3')
sha256sums=('3d9d5088f4dc440be848321e95186116b2fdc28f74e032947d8095d30e2a09a9'
            '534ead09f9c6a9e827d058d1df5b50ace55c83e6402a906adeed378ffd463cb3')

build() {
  cd "${srcdir}/rpcCalc/source"
  python2 -m compileall .
  install -d -m 0755 "${pkgdir}"/usr/{share/rpccalc,bin}
  install -m 0644 *.py{,c} "${pkgdir}/usr/share/rpccalc/"
  install -m 0755 "${srcdir}/rpccalc" "${pkgdir}/usr/bin/rpccalc"
}

# vim:set ts=2 sw=2 et:
