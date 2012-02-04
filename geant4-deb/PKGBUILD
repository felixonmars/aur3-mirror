# Maintainer: Yngve Inntjore Levinsen <yngve.inntjore.levinsen@cern.ch>


pkgname=geant4-deb
_pkgname=geant4
pkgver=4.9.4.p02.1
_pkgver=4.9.4.p02-1
pkgrel=1
_clhepver=2.1.0.1
_sover=7

# geant4 must be linked against a specific clhep version!
conflicts=('geant4')
provides=('geant4')
pkgdesc=""

makedepends=('deb2targz' 'tar')
optdepends=('gnuplot: Plotting functionality' 'root: Analytical framework' 'dawn: Tool to display geometry' 'gv: Postscript viewer' 'cernlib: PAW support and/or g3tog4 support?')
depends=('libx11' 'libxcb' 'glibc' 'zlib' 'libgl' 'libxaw' 'lesstif' 'libxmu' 'xerces-c-2' "clhep==${_clhepver}")
arch=('x86_64' 'i686')
license=('http://geant4.web.cern.ch/geant4/license/')
url="http://cern.ch/geant4"
if [ "${CARCH}" = "x86_64" ]; then
    md5sums=('14298e7e873f13b00a44d254808d5483'
             '6bf986f99c03e9fb25bffb017c0f7f5e'
             '27b554584c05cfe9392db6f5cdad3ad2'
             'c2a8b43101f72398e8b252c5f84dfb62'
             '8c7db86cd12fb4024ec661fb40404402'
             '76c667fbbdb69167221831fb4f603a50'
             'db9c22c4904b5152f495f3e6a96c9123'
             '6f15e44025a59a8288c9b3c401562bf9'
             '32a27a3e6685c56a6331bc8ec14f023e'
             'da86ae4e93946c6f033e2b0a9d763678'
             '7e14ea893368ea48a1ee9b7e37fa9846')
    _carch=amd64
    source=(
      ${_pkgname}-$pkgver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/g/${_pkgname}/${_pkgname}_${_pkgver}_all.deb"
      ${_pkgname}-common-$pkgver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/g/${_pkgname}/${_pkgname}-common_${_pkgver}_all.deb"
      ${_pkgname}-headers-$pkgver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/g/${_pkgname}/${_pkgname}-headers_${_pkgver}_all.deb"
      ${_pkgname}-examples-$pkgver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/g/${_pkgname}/${_pkgname}-examples_${_pkgver}_all.deb"
      lib${_pkgname}-$pkgver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/g/${_pkgname}/lib${_pkgname}-4.9-${_sover}_${_pkgver}_${_carch}.deb"
      lib${_pkgname}-dev-$pkgver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/g/${_pkgname}/lib${_pkgname}-dev_${_pkgver}_${_carch}.deb"
      lib${_pkgname}-plists-$pkgver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/g/${_pkgname}/lib${_pkgname}-plists-4.9-${_sover}_${_pkgver}_${_carch}.deb"
      lib${_pkgname}-plists-dev-$pkgver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/g/${_pkgname}/lib${_pkgname}-plists-dev_${_pkgver}_${_carch}.deb"
      libg4opengl-$pkgver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/g/${_pkgname}/libg4opengl-4.9-${_sover}_${_pkgver}_${_carch}.deb"
      libg4opengl-dev-$pkgver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/g/${_pkgname}/libg4opengl-dev_${_pkgver}_${_carch}.deb"
      install-geant4-data.conf
    )
elif [ "${CARCH}" = "i686" ]
then
    pkgver=4.9.3.p01.1
    _pkgver=4.9.3.p01-1
    pkgrel=1
    _sover=6
    
    # geant4 must be linked against a specific clhep version!
    _clhepver=2.0.4.7
    _clhepdebver=2.0.4.7-1
    conflicts=('clhep' 'geant4')
    provides=("clhep=${_clhepver}" 'geant4')
    md5sums=('e75559767a2853a9b5d78a01e650411e'
             '9b6c7eb7c6d61ce44078da05d5ace990'
             '4630912b84ef7a4e20e687511ca877e9'
             '9b282b6eb96fc8b12b30addc5d085d89'
             '6bdf49f56dcc422f3057e43e10d1149f'
             'd6ebbccee4d1c038763403e38e3c1d15'
             '8dd578596d47289b62483b4b24607056'
             '82411866587d7a2a38af7fb8b1428444'
             '4053d3b997e4c39ff4c18e664819ab2a'
             'b4fdbdd4ee29d997122557b39a5fec2b'
             '768704ab6bdb407e6249485b98881b26'
             'a62a7bb8f06ef8d0052ddc9bca40abbf'
             '7e14ea893368ea48a1ee9b7e37fa9846')
     _carch=i386
    source=(
      ${_pkgname}-$pkgver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/g/${_pkgname}/${_pkgname}_${_pkgver}_all.deb"
      ${_pkgname}-common-$pkgver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/g/${_pkgname}/${_pkgname}-common_${_pkgver}_all.deb"
      ${_pkgname}-headers-$pkgver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/g/${_pkgname}/${_pkgname}-headers_${_pkgver}_all.deb"
      ${_pkgname}-examples-$pkgver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/g/${_pkgname}/${_pkgname}-examples_${_pkgver}_all.deb"
      lib${_pkgname}-$pkgver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/g/${_pkgname}/lib${_pkgname}-4.9-${_sover}_${_pkgver}_${_carch}.deb"
      lib${_pkgname}-dev-$pkgver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/g/${_pkgname}/lib${_pkgname}-dev_${_pkgver}_${_carch}.deb"
      lib${_pkgname}-plists-$pkgver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/g/${_pkgname}/lib${_pkgname}-plists-4.9-${_sover}_${_pkgver}_${_carch}.deb"
      lib${_pkgname}-plists-dev-$pkgver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/g/${_pkgname}/lib${_pkgname}-plists-dev_${_pkgver}_${_carch}.deb"
      libg4opengl-$pkgver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/g/${_pkgname}/libg4opengl-4.9-${_sover}_${_pkgver}_${_carch}.deb"
      libg4opengl-dev-$pkgver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/g/${_pkgname}/libg4opengl-dev_${_pkgver}_${_carch}.deb"
    # Use this if the clhep version in aur is not the same as required for geant4:
       clhep-$_clhepver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/c/clhep2/clhep2_${_clhepdebver}_${_carch}.deb"
       clhep-dev-$_clhepver.deb::"http://lcg-heppkg.web.cern.ch/lcg-heppkg/debian/pool/hep/c/clhep2/clhep2-dev_${_clhepdebver}_${_carch}.deb"
       install-geant4-data.conf
    )
fi


build() {
   install -d ${pkgdir}/usr/share/licenses/${pkgname}
   
   deb2targz geant4-$pkgver.deb > /dev/null
   deb2targz geant4-common-$pkgver.deb > /dev/null
   deb2targz geant4-headers-$pkgver.deb > /dev/null
   deb2targz geant4-examples-$pkgver.deb > /dev/null
   deb2targz libgeant4-$pkgver.deb > /dev/null
   deb2targz libgeant4-dev-$pkgver.deb > /dev/null
   deb2targz libgeant4-plists-$pkgver.deb > /dev/null
   deb2targz libgeant4-plists-dev-$pkgver.deb > /dev/null
   deb2targz libg4opengl-$pkgver.deb > /dev/null
   deb2targz libg4opengl-dev-$pkgver.deb > /dev/null
   deb2targz libg4opengl-$pkgver.deb > /dev/null
   deb2targz libg4opengl-dev-$pkgver.deb > /dev/null
   tar -xzf geant4-$pkgver.tar.gz
   tar -xzf geant4-common-$pkgver.tar.gz
   tar -xzf geant4-headers-$pkgver.tar.gz
   tar -xzf geant4-examples-$pkgver.tar.gz
   tar -xzf libgeant4-$pkgver.tar.gz
   tar -xzf libgeant4-dev-$pkgver.tar.gz
   tar -xzf libgeant4-plists-$pkgver.tar.gz
   tar -xzf libgeant4-plists-dev-$pkgver.tar.gz
   tar -xzf libg4opengl-$pkgver.tar.gz
   tar -xzf libg4opengl-dev-$pkgver.tar.gz

   if [ "$CARCH" == "i686" ]
   then
       #adding clhep:
       msg "Adding CLHEP ${CARCH}"
       deb2targz clhep-$_clhepver.deb
       deb2targz clhep-dev-$_clhepver.deb
       tar -xzf clhep-$_clhepver.tar.gz
       tar -xzf clhep-dev-$_clhepver.tar.gz
   fi

   cp -r usr/ ${pkgdir}/
   cp -r etc/ ${pkgdir}/
   install -D -m644 usr/share/doc/geant4/copyright ${pkgdir}/usr/share/licenses/${pkgname}/
   if [ "$CARCH" == "i686" ] # already updated in x86_64 package
   then
        msg "Updating datafiles versions"
        rm ${pkgdir}/etc/install-geant4-data.conf
        install -D -m644 install-geant4-data.conf ${pkgdir}/etc/install-geant4-data.conf
   fi
  }

post_install() {
  msg "This install of Geant4 does not set up the environment variables."
  msg "Instead, it has installed three scripts, g4make, g4run, and g4env"
  msg "In order to compile a Geant4 project, use the command 'g4make'"
  msg "In order to run a Geant4 project, use 'g4run <executable>'"
  msg "In order to view your current environment setting, use 'g4run g4env'"
}
