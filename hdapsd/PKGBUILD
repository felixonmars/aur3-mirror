# Contributor: Emil Renner Berthing <esmil@mailme.dk>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=hdapsd
pkgver=20090401
pkgrel=4
pkgdesc='HDAPS userspace hard drive protection daemon'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/hdaps/'
license=('GPL')
depends=('glibc')
backup=('etc/conf.d/hdapsd')
source=("http://downloads.sourceforge.net/hdaps/hdapsd-${pkgver}.tar.gz"
	'hdapsd.conf.d'
        'hdapsd.rc.d'
        'hdapsd.systemd'
        'hdapsd.wrapper')
sha512sums=('4984a6c636d3447051ca5629fec89f08eee3773750f9623b80d7c0d4af65dcf9868392f2e93f5d13ac329d311ec2ebcdddf3e438007d1f851a920137c6903c96'
            '1823a05a6b11cfd2109e2ae94b22340e23ebbd6c48635491bbd6457d48678aa9b51cb7c45f5dd62432f6882203b1c3136ed1a31620b924d5227cc16b5af9264f'
            '36fdeb57cc817809d48f749df765a00617dbcd411833b11d5179300b49b4780e8c8619ba34a386d5f6c111ee6d74d354e9b3d88e654ab6cfd0b3e7055cb16ff3'
            '1a1824e22b9fbf590d19a5dabf1f106ee983249316797317794a04058e2663a103b776eeea3d4d7822a14874aec90b02845c570816b97f0d3dbc07c26f349947'
            '509a4759448f40e667fe7777e0522f7b277189ccce63078e1d0bc4b1e8e1f25ffa0ab3be7c4d917f404149b0129d6eb94825a7baacf77c8124bb9f59706e2e57')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc
  make ${MAKEFLAGS}
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install

  # install rc script and its configuration file
  install -Dm644 "${srcdir}/hdapsd.conf.d" "${pkgdir}/etc/conf.d/hdapsd"
  install -Dm755 "${srcdir}/hdapsd.rc.d" "${pkgdir}/etc/rc.d/hdapsd"
  install -Dm644 "${srcdir}/hdapsd.systemd" "${pkgdir}/usr/lib/systemd/system/hdapsd.service"
  install -Dm755 "${srcdir}/hdapsd.wrapper" "${pkgdir}/usr/sbin/hdapsd-wrapper"
}
