# Maintainer: Mike Shutlar (iFSS) <mike at epinux(dot)co(dot)uk>
pkgname=nifskope-git
pkgver=20111025
pkgrel=1
pkgdesc="A tool for analyzing and editing NetImmerse/Gamebryo files (.nif)"
arch=('i686' 'x86_64')
url="http://niftools.sourceforge.net/wiki/NifSkope"
license=('custom:BSD')
groups=('niftools' 'niftools-git')
depends=('qt')
makedepends=('python2')
provides=('nifskope')
conflicts=('nifskope')
install='nifskope.install'

_gitroot="git://github.com/amorilia/nifskope.git"
_gitname="nifskope"

build() {
  cd "${srcdir}"

  msg "Connecting to the GIT repository..."
  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull origin
  else
    git clone --depth=1 --recursive ${_gitroot}
  fi
  msg "GIT checkout done (who invented that stupid 'server timeout' message? :)"

  # Make documentation
  cd "${srcdir}/${_gitname}/docsys"
  python2 nifxml_doc.py

  # Configure
  cd "${srcdir}/${_gitname}"
  ./makeconfig.sh

  # Translations
  cd "${srcdir}/${_gitname}/lang"
  for i in *.ts; do lrelease $i; done

  # Build
  cd "${srcdir}/${_gitname}"
  qmake -after TARGET=nifskope
  make
}


package() {
  cd "${srcdir}/${_gitname}"
  install -D -m755 nifskope "${pkgdir}/usr/bin/nifskope"
  install -D -m644 nifskope.png "${pkgdir}/usr/share/pixmaps/nifskope.png"
  install -d "${pkgdir}/usr/share/nifskope/doc"
  install -d "${pkgdir}/usr/share/nifskope/shaders"
  install -d "${pkgdir}/usr/share/nifskope/lang"
  install -D -m644 docsys/nifxml/nif.xml "${pkgdir}/usr/share/nifskope/nif.xml"
  install -D -m644 docsys/kfmxml/kfm.xml "${pkgdir}/usr/share/nifskope/kfm.xml"
  install -D -m644 style.qss "${pkgdir}/usr/share/nifskope/style.qss"
  install -D -m644 shaders/*.frag "${pkgdir}/usr/share/nifskope/shaders"
  install -D -m644 shaders/*.prog "${pkgdir}/usr/share/nifskope/shaders"
  install -D -m644 shaders/*.vert "${pkgdir}/usr/share/nifskope/shaders"
  install -D -m644 docsys/doc/*.html "${pkgdir}/usr/share/nifskope/doc"
  install -D -m644 docsys/doc/docsys.css "${pkgdir}/usr/share/nifskope/doc"
  install -D -m644 docsys/doc/favicon.ico "${pkgdir}/usr/share/nifskope/doc"
  install -D -m644 lang/*.ts "${pkgdir}/usr/share/nifskope/lang"
  install -D -m644 lang/*.qm "${pkgdir}/usr/share/nifskope/lang"
  install -D -m644 linux-install/nifskope.desktop "${pkgdir}/usr/share/applications/nifskope.desktop"
  install -d "${pkgdir}/usr/share/mime/application"
  install -D -m644 linux-install/*.xml "${pkgdir}/usr/share/mime/application"
  install -D -m644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
  install -D -m644 *.TXT "${pkgdir}/usr/share/nifskope/doc"
}
