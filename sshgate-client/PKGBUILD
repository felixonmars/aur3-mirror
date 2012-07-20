# Contributor: max-k <max-k@post.com>

pkgname="sshgate-client"
_pkgname="sshGate-client"
pkgver="0.2.beta"
pkgrel=2
pkgdesc="Small script to help to use sshGate server"
arch=(i686 x86_64)
url="https://github.com/Tauop/sshGate-client"
license=('GPLv2')
depends=('scripthelper')
optdepends=()
conflicts=()
install='install'

source=(
  "https://github.com/downloads/Tauop/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
  "bash_completion"
)

md5sums=(
  '6c8e14d38ac7754c793675415a9902fd'
  '4942be0fffb4738b5c4ef2935a371150'
)


build() {
cd ${startdir}/src/${_pkgname}-${pkgver}
install -D -m 644 COPYING ${startdir}/pkg/usr/share/licences/${pkgname}/COPYING
install -D -m 644 README ${startdir}/pkg/usr/share/doc/${pkgname}/README
mkdir -p ${startdir}/pkg/usr/local/bin
sed -i 's/sshgate-client-configure/#sshgate-client-configure/' sshg
install -D -m 755 {sshg,scpg,sshgate-client-configure} ${startdir}/pkg/usr/local/bin/
install -D -m 644 ${startdir}/bash_completion ${startdir}/pkg/usr/share/${pkgname}/bash_completion
}
