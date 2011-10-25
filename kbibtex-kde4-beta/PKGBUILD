# Maintainer: Yngve Inntjore Levinsen <yngve.inntjore.levinsen@cern.ch>

pkgname=kbibtex-kde4-beta
_pkgver=0.4
_beta=2
pkgver=${_pkgver}.beta${_beta}
pkgrel=1

pkgdesc="A BibTeX editor for KDE to edit bibliographies used with LaTeX, beta version."
url="http://home.gna.org/kbibtex/"
license=('GPL')
depends=('kdelibs>=4.2.0' 'poppler-qt')
optdepends=('bibtex2html: to convert bibtex files to html files' 'libxslt: Required to transform
XML files' 'libxml2: Required to transform XML files')
provides=('kbibtex-kde4')
conflicts=('kbibtex-kde4-svn')
makedepends=('cmake' 'automoc4' 'patch')
source=('changes.diff'
         http://download.gna.org/kbibtex/${_pkgver}/kbibtex-${_pkgver}-beta${_beta}.tar.bz2)
md5sums=('66a22a9594d3fe9a10444011cc3d267e'
         '09e390453d08ab1bd57dd20bdbe7d84b')
arch=('i686' 'x86_64')

  build() {

      if [ -d kbibtex-${_pkgver}-beta${_beta} ]; then
        rm -rf kbibtex-${_pkgver}-beta${_beta}
      fi      
      tar -xjf kbibtex-${_pkgver}-beta${_beta}.tar.bz2
      cd kbibtex-${_pkgver}-beta${_beta}

      msg "patching desktop file"
      patch -Np0 -i ../changes.diff
      
      mkdir build && cd build

      install_prefix=`kde4-config --prefix`
      cmake -DCMAKE_INSTALL_PREFIX="${install_prefix}" \
            -DCMAKE_BUILD_TYPE=Debug \
            -DBINARY_POSTFIX=-kde4-beta \
            ../

      make || return 1
  }
  
  package() {
      cd ${srcdir}/kbibtex-${_pkgver}-beta${_beta}/build
      make DESTDIR=${pkgdir} install || return 1
      cd .. && rm -rf build
      # This is not necessary anymore, but anyways..
      patch -NRp0 -i ../changes.diff
  }
