# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=bbbike
pkgver=3.18
pkgrel=1
pkgdesc="A route planner for cyclists"
arch=("i686" "x86_64")
url="http://bbbike.sourceforge.net/"
license=('GPL')
depends=('perl-tk')
options=(!strip)
install=bbbike.install
[[ $CARCH == "x86_64" ]] && __LOCALARCH="amd64" || __LOCALARCH="i386"
#__LOCALARCH="i386"
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}_${pkgver}-1_${__LOCALARCH}.deb")
#if [[ $CARCH == "x86_64" ]]; then 
#else
#fi
md5sums=('6ed71f4bd599acba5dc497a55d9ff11a')
sha256sums=('258cd74de42d04be7bb94cbdfb4477df935bd6ba0971db686cc0bb6a476442f1')

build() {
  cd "${srcdir}"
  bsdtar xvf "${pkgname}_${pkgver}-1_${__LOCALARCH}.deb"
}

package() {
  cd "${srcdir}"

  bsdtar xvf data.tar.gz -C ${pkgdir}
  [[ $CARCH == "x86_64" ]] && unlink ${pkgdir}/bbbike-debian

  rm -f ${pkgdir}/usr/share/doc/${pkgname}/changelog.Debian.gz
}

# vim:set ts=2 sw=2 et:
