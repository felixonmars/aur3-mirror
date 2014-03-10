# Maintainer: Cloud Han <heliumhgy@gmail.com>

pkgname=huhamhire-hosts
pkgver=1.9.8
pkgrel=1
pkgdesc="或称 hoststool. 由于众所周知的原因，普通用户需要对系统 hosts 文件进行维护。通过使用本工具整理出的这些hosts文件，能给大家的网络生活带来便捷。"
arch=('any')
url="https://hosts.huhamhire.com/"
license=('GPL 3')
groups=()
depends=('python2-pyqt4')
makedepends=()
optdepends=()
provides=('huhamhire-hosts')
conflicts=()
replaces=()
backup=()
options=()
install='hoststool.install'
changelog=
source=("${pkgname}-x11-gpl-${pkgver}-SE.tar.gz::https://huhamhire-hosts.googlecode.com/git-history/gh-pages/release/HostsTool-x11-gpl-${pkgver}-SE.tar.gz"
  "hoststool")
md5sums=('982eb0fedc5c3b076326eaf06fc87c23'
         'c6cc648dee8e9043d65cf549f81e2dd6')
noextract=()

build() {
  mv "HostsTool-x11-gpl-${pkgver}-SE" "huhamhire-hosts-${pkgver}"
} 

package() {
  rm "${srcdir}/huhamhire-hosts-${pkgver}/README.rst"
  install -dm 755 "${pkgdir}/usr/share/${pkgname}"
  cp -r "${srcdir}/${pkgname}-${pkgver}"/* \
    "${pkgdir}/usr/share/${pkgname}"
  find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 {} \;
  
  install -dm 755 "${pkgdir}/usr/bin"
  cp "${startdir}/hoststool" "${pkgdir}/usr/bin"
  chmod 755 "${pkgdir}/usr/bin/hoststool"
}
