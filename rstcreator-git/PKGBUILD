# Maintainer: Theo J.A. de Vries <t.j.a.devries(at)gmail(dot)com>

# for customization
_pkgname=rstcreator
_ext=git
_basedir=/usr
_gitname=rstcreator
# note: depends=() needs separate customization

pkgname=${_pkgname}-${_ext}
pkgver=v0.03.39.gf9ec9b9
pkgrel=1
pkgdesc="rstCreator facilitates the production of various types of documents with the help of QtCreator and Sphinx."
arch=("any")
url="https://bitbucket.org/theojadevries/rstcreator"
license=("Apache")
groups=()
depends=("qtcreator")
makedepends=("git")
optdepends=()
provides=("rstcreator")
conflicts=("rstcreator")
#backup=()
#options=()
#install=

source=(
         'git+https://theojadevries@bitbucket.org/theojadevries/rstcreator.git'
        )

prepare() {
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname-build
  msg "Copying common sphinx module to each of the specialized modules.."
  mv ${srcdir}/$_gitname-build/qbs/modules/sphinx ${srcdir}/$_gitname-build/qbs/sphinx
  SPHINXFILES=${srcdir}/$_gitname-build/qbs/sphinx/*
  MODULES=${srcdir}/$_gitname-build/qbs/modules/*
  for moduleB in ${MODULES}; do
    for sphinxFile in ${SPHINXFILES}; do
      cp ${sphinxFile} ${moduleB}
    done
  done
}

package() {
#  cd $_gitname-build
  msg "Installing products"
  install -m755 -d ${pkgdir}${_basedir}/share/qtcreator/qbs/share/qbs/imports/qbs/base
  PRODUCTFILES=${srcdir}/$_gitname-build/qbs/imports/base/*
  for productFile in ${PRODUCTFILES}; do
    install -m644 ${productFile} ${pkgdir}${_basedir}/share/qtcreator/qbs/share/qbs/imports/qbs/base
  done
  MODULES=${srcdir}/$_gitname-build/qbs/modules/*
  for moduleB in ${MODULES}; do
    MODULENAME=$(basename ${moduleB})
    msg "Installing ${MODULENAME}"
    install -m755 -d ${pkgdir}${_basedir}/share/qtcreator/qbs/share/qbs/modules/${MODULENAME}
    MODULEFILES=${moduleB}/*
    for moduleFile in ${MODULEFILES}; do
      install -m644 ${moduleFile} ${pkgdir}${_basedir}/share/qtcreator/qbs/share/qbs/modules/${MODULENAME}
    done
  done
  msg "Installing highlighter"
  install -m755 -d ${pkgdir}${_basedir}/share/qtcreator/generic-highlighter
  HIGHLIGHTFILES=${srcdir}/$_gitname-build/generic-highlighter/*
  for highlightFile in ${HIGHLIGHTFILES}; do
    install -m644 ${highlightFile} ${pkgdir}${_basedir}/share/qtcreator/generic-highlighter
  done
  msg "Installing wizard"
  install -m755 -d ${pkgdir}${_basedir}/share/qtcreator/templates/wizards/rstCreator
  WIZARDFILES=${srcdir}/$_gitname-build/wizard/*
  for wizardFile in ${WIZARDFILES}; do
    install -m644 ${wizardFile} ${pkgdir}${_basedir}/share/qtcreator/templates/wizards/rstCreator
  done
}
md5sums=('SKIP')
