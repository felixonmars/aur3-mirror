# Contributer: Jamie Nguyen <jamie tomoyolinux co uk>

pkgname=obmocmenu
pkgver=0.8.4
pkgrel=2
pkgdesc="An Openbox pipe menu for the management of Music On Console (moc)"
arch=('any')
url='http://www.sourceforge.net/projects/obmocmenu/'
license=('GPL2')
depends=('openbox' 'moc')
optdepends=('zenity: for adding multiple random entries to the playlist')
backup=('etc/obmocmenu.conf')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")

build()
{
  cd "${srcdir}/obmocmenu-${pkgver}"
	
  # install script
  install -d -m755 "${pkgdir}/usr/bin/"
  install -m755 obmocmenu "${pkgdir}/usr/bin/obmocmenu"

  # install config file
  install -d -m755 "${pkgdir}/etc/"
  install -m644 obmocmenu.conf "${pkgdir}/etc/obmocmenu.conf"
}

sha256sums=('45279bfccb7589ec766739dd57541647f3507cecd684bc35a8f9358a018cad57')
