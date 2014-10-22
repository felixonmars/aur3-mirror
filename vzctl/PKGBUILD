# Maintainer:   Lucky <archlinux@builds.lucky.li>
# Contributor:  Jonny Gerold <fsk141@gmail.com>

pkgname=vzctl
pkgver=4.8
pkgrel=1
pkgdesc="OpenVZ containers control utility"
url="http://wiki.openvz.org/Download/vzctl/${pkgver}"
license=("GPL")
arch=("i686" "x86_64")
depends=("iproute" "libcgroup>=0.37" "libxml2" "openssh" "ploop" "rsync")
source=("http://download.openvz.org/utils/${pkgname}/${pkgver}/src/${pkgname}-${pkgver}.tar.bz2"
        "openvz")
md5sums=("ad3e9f06ddd553885517952e820325bc"
         "4957ae2e416e35a974cc216c6a1dc1aa")
sha1sums=("cb36bcd6f73f35a43b6ec61fc3938089d3ae78f3"
          "43a7a9ed83cc6918d81ea6e6990fde69629ef308")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --libdir=/usr/lib --enable-bashcomp --enable-logrotate --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "${srcdir}/openvz" "${pkgdir}/etc/rc.d/openvz"
  make DESTDIR="${pkgdir}" \
    sbindir="/usr/bin" \
    bindir="/usr/bin" \
    install
}
