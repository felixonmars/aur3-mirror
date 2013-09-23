# Maintainer:  perlawk

pkgname=euiup
_pkgname=euphoria
pkgver=2010
pkgrel=1
pkgdesc="EuIUP, a Euphoria wrapper around the Iup GUI toolkit. The wrapper is written in 100% Euphoria."
url="http://jeremy.cowgar.com/euiup/"
depends=('euphoria64' 'iup-gtk')
license=('custom:"OpenEuphoria License"')
conflicts=('')
arch=('x86_64')
source=("http://bitbucket.org/jcowgar/euiup/get/default.tar.gz")

package() {
  cd "${srcdir}/jcowgar-euiup-0583c4409a6a"

  mkdir -p "${pkgdir}/usr/share/${_pkgname}/include"
	cp -a iup "${pkgdir}/usr/share/${_pkgname}/include" 
}

md5sums=('aa1474661e4e79216a0768d0872a565c')
