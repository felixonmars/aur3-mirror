# Maintainer: Gijsbert Stoet <gijsbert.stoet@glasgow.ac.uk>
pkgname=send_email_via_smtp
pkgver=0.9
pkgrel=1
pkgdesc="Sends email from the command line via (password protected) smtp server"
url="http://volition.gla.ac.uk/software/send_email_via_smtp"
arch=('any')
license=('GPL3')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://volition.gla.ac.uk/software/send_email_via_smtp/${pkgname}.src.${pkgver}.tar.gz")
md5sums=('ae0b385cffe181488802244291378ba9')

package() {
  cd "${srcdir}/send_email_via_smtp_src"
  ./install.sh
}
 
