# Maintainer: Your Name <youremail@domain.com>
pkgname=pdfid
pkgver=0_0_12
pkgrel=1
pkgdesc="Tool for identifying malicious PDFs"
arch=(any)
url="http://blog.didierstevens.com/programs/pdf-tools/"
license=('custom')
depends=(python)
source=(http://www.didierstevens.com/files/software/${pkgname}_v${pkgver}.zip)

# nothing to be done here
#build() {
#}

package() {
  cd ${srcdir}

  install -D -m 755 ${pkgname}.py ${pkgdir}/usr/bin/${pkgname}
}

sha512sums=('234d94b342a6365e97e3a041e3b0206e9615e7f7efae69a7fe7980639b73ae92a87dfe90edb3613736ffcb83fabfc51fb3bcc77e5fc2e61233c62f81eb800154')
