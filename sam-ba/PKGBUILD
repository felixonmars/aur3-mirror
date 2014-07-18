# Maintainer: emerg.reanimator
# NOTE: uucp group membership reguired in order to acces /dev/ttyACM0
# NOTE: X server is implicit dependency
pkgname=sam-ba
pkgver=2.12
pkgrel=7
pkgdesc="The SAM Boot Assistant (SAM-BA). It allows to program flash media through RS232, USB or Jtag SAM-ICE link."
url="http://www.atmel.com/tools/ATMELSAM-BAIN-SYSTEMPROGRAMMER.aspx"
arch=('x86_64' 'i686')
license=('unknown')
depends=('lib32-libxss' 'gcc-multilib' 'lib32-libxft' 'tcl' 'tk')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
options='!strip'

__patch_name='patch7'

source=("http://www.atmel.com/dyn/resources/prod_documents/${pkgname}_${pkgver}.zip"
	"http://www.atmel.com/images/${__patch_name}.gz")
md5sums=('18d74822d979375a52ae4e345b8d1506'
	 '58219bcfee11db789b923cd6270465a3')

prepare() {
    msg "Patching with ${__patch_name}"
    cd "${srcdir}/sam-ba_cdc_cdc_linux/"
    patch -Np1 -i "${srcdir}/${__patch_name}"
}

package() {
    cd "${srcdir}"
    mkdir -p $pkgdir/opt/sam-ba
    cp -a sam-ba_cdc_cdc_linux/* ${pkgdir}/opt/sam-ba
}

