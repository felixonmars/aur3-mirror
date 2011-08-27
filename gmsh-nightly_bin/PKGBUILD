# Contributor: mickele <mimocciola@yahoo.com>
# Contributor: gborzi <gborzi@ieee.org>
# Contributor: Emanuele Rossi <nuovodna at gmail dot com>
# Maintainer: wallish <wallish77 at gmail dot com>

pkgname=gmsh-nightly_bin
pkgver=2.5.1+svn
pkgrel=1
pkgdesc="Gmsh is an automatic 3D finite element mesh generator with pre and post-processing facilities."
arch=('i686' 'x86_64')
url="http://www.geuz.org/gmsh/"
license=('custom')
depends=('fltk' 'lapack' 'lua' 'med')
makedepends=('cmake' 'desktop-file-utils' 'sed' 'coreutils')
optdepends=('opencascade>=6.5.0: for iges import' 
			'gmsh-docs: docs for gmsh')
conflicts=('gmsh')
source=(http://www.geuz.org/gmsh/bin/Linux/gmsh-nightly-Linux.tgz gmsh-nightly.desktop)
md5sums=('b6ebe01b36f2f7adc854ea0a56a38c8f'
         'a0790ee6e40092b544c1ee708ab27bdc')	 

build(){
  cd "${srcdir}/gmsh-2.5.1-svn-Linux" || return 1

  # Intallation
  mkdir -p ${pkgdir}/opt/gmsh-nightly
  cp -a ./* ${pkgdir}/opt/gmsh-nightly || return 1

  # Scripts for running it
  mkdir -p ${pkgdir}/usr/bin/
  cat << EOF > ${pkgdir}/usr/bin/gmsh
#!/bin/bash
cd /opt/gmsh-nightly/bin
./gmsh \$@
EOF
 
  # Fixing permissions
  chmod 755 ${pkgdir}/usr/bin/gmsh || return 1

  # .desktop file 
  mkdir -p ${pkgdir}/usr/share/applications
  install -m 644 ${srcdir}/gmsh-nightly.desktop ${pkgdir}/usr/share/applications || return 1
  install -m 644 ${srcdir}/gmsh-nightly.desktop ${pkgdir}/usr/share/applications || return 1

} 
