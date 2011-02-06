# Maintainer: Michele Mocciola <mickele>
# Contributor: Brice Méalier <mealier_brice____AT____yahoo____DOT____fr>
pkgname=homard
pkgver=9.5
pkgrel=3
pkgdesc="A refinement and de-refinement mesh tool, used by Code_Aster for its adaptative mesh capability."
url="http://www.code-aster.org/outils/homard"
license="custom: Free for use within Code-Aster"
depends=('python')
makedepends=('sed' 'coreutils')
arch=(i386)
provides=()
conflicts=()
replaces=()
backup=()
arch=('i686' 'x86_64')
install=(homard.install)
source=(http://www.code-aster.org/V2/UPLOAD/DOC/Telechargement/aster-full-src-10.1.0-4.noarch.tar.gz)

_installdir=/opt/aster/outils/HOMARD
_pkgversrc=${pkgver}-1
_pythonver=2.6

build() {
  bsdtar -x -f aster-full-src-10.1.0/SRC/${pkgname}-${_pkgversrc}.all.tar.gz || return 1

  cd "${srcdir}/${pkgname}-${pkgver}/HOMARD" || return 1

  # ASTER_HOMARD
  install -d 755 "${pkgdir}${_installdir}/ASTER_HOMARD" || return 1
  cp -rf ASTER_HOMARD/aster_homard_py "${pkgdir}${_installdir}/ASTER_HOMARD" || return 1

  # homard
  sed -e "s|/logiciels/HOMARD/HOMARD_PUBLIC|$_installdir|g" \
      -i "${srcdir}/${pkgname}-${pkgver}/HOMARD/homard_base"
  install -m 755 homard_base "${pkgdir}${_installdir}/ASTER_HOMARD/homard" || return 1

  # Linux/Linux64
  if [ "$CARCH" = "x86_64" ]; then
     install -m 755 -D Linux64/HOMARD_V${pkgver}.out "${pkgdir}${_installdir}/Linux64/HOMARD_V${pkgver}.out" || return 1
     cp -rf Linux64/CAS_TESTS "${pkgdir}${_installdir}" || return 1
  else
     install -m 755 Linux/HOMARD_V${pkgver}.out "${pkgdir}${_installdir}/Linux/HOMARD_V${pkgver}.out" || return 1
     cp -rf Linux/CAS_TESTS "${pkgdir}${_installdir}" || return 1
  fi

  # Intranet
  cp -rf Intranet "${pkgdir}${_installdir}" || return 1

  # link to access to homard from codeaster
  ln -sf "${_installdir}/ASTER_HOMARD/homard" "${pkgdir}/opt/aster/outils/homard"
			  
  python /usr/lib/python${_pythonver}/compileall.py "${pkgdir}${_installdir}"
  python -O /usr/lib/python${_pythonver}/compileall.py "${pkgdir}${_installdir}"
}
md5sums=('49fe55a0a46491124c16965a2db59c5e')
