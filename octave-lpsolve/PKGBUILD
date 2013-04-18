# Maintainer: Nick Vandal <vandalusna@gmail.com>
_pack=lpsolve
pkgname=octave-${_pack}
_majorver=5.5
_minorver=2
_levelver=0
pkgver="${_majorver}.${_minorver}.${_levelver}"
pkgrel=1
pkgdesc="Wrapper to lp_solve for Octave. Mixed Integer Linear Programming (MILP) solver lp_solve solves pure linear, (mixed) integer/binary, semi-cont and special ordered sets (SOS) models"
arch=('x86_64' 'i686')
url="http://lpsolve.sourceforge.net/5.5/Octave.htm"
license=('LGPL')
depends=('lpsolve' 'octave')
install=$pkgname.install
source=("http://downloads.sourceforge.net/project/lpsolve/lpsolve/${pkgver}/lp_solve_${pkgver}_octave_source.tar.gz"
        "COPYING"
        "DESCRIPTION"
        "INDEX"
        "Makefile"
        "short-circuit.patch")
md5sums=('b8ea22788d119bcd514d057a74f4c430'
         'ae8eb7d0e748a977e2320ff70d4b6550'
         'b75b3833aaeebb04730db156afe61838'
         'dd8acd28d9ea11554dd2b0eddfb47631'
         '07aef4ffcac5cf5d36bb0284bc04ebce'
         '896633f683bd740b643a21a6b4ce2ed1')

_archive=${_pack}-${_majorver}.${_minorver}.tar.gz

prepare()
{
    #Make octave pkg.tar.gz (source not distributed from octave-forge)
    mkdir -p "${srcdir}/package/"{doc,inst,src}
    cp "${startdir}/"{COPYING,DESCRIPTION,INDEX} "${srcdir}/package/"
    cp "${startdir}/Makefile" "${srcdir}/package/src/"
    cd "${srcdir}/lp_solve_${_majorver}/extra/octave/${_pack}/"
    patch -p0 < "${startdir}/short-circuit.patch"
    cp changes "${srcdir}/package/ChangeLog"
    cp Octave.htm "${srcdir}/package/doc/"
    cp *.m "${srcdir}/package/inst/"
    cp *.h *.c octave.cpp "${srcdir}/package/src/"
    rename .c .cpp "${srcdir}/package/src/"*.c
    cd "${srcdir}"
    tar czf "${_archive}" package/
}

build() {
  cd "$srcdir"
  mkdir -p builddir
  octave -q -f --eval "pkg build -verbose -nodeps builddir $_archive"
}

package() {
    mkdir -p "${pkgdir}/usr/share/octave/packages"
    mkdir -p "${pkgdir}/usr/lib/octave/packages"
    cp "$srcdir/builddir/$_archive" "$pkgdir/usr/share/octave/$_pack.tar.gz"
}
