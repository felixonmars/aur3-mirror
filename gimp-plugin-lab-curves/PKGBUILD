# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=gimp-plugin-lab-curves
pkgver=2010.07.09
pkgrel=2
pkgdesc="Allows to use curves on the L*a*b* color channels of the given image"
arch=('i686' 'x86_64')
url="http://www.mm-log.com/lab-curves-gimp"
license=('GPL3')
depends=('lcms2' 'graphicsmagick' 'qt4')
options=()
source=(http://downloads.sourceforge.net/project/mmfilters/LabCurves/${pkgver//./-}/LabCurves-src-${pkgver//./}.7z \
        set_exec_path.diff)
md5sums=('bd9a77f3a5de51891948df7331393139'
         '70202b52a2d68ec29c3a4e1f6d2c5e45')

build() {
  cd "$srcdir"

  cd "$srcdir"/LabCurves

  # remove build dependecny on ccache
  find . -name "*.pro" -exec sed -i 's|ccache||g' '{}' ';'
  # fix executable path
  patch -Np1 < "$srcdir"/set_exec_path.diff || true

  qmake-qt4
  make
}

package() {
  cd "$srcdir"/LabCurves

  install -D -m755 LabCurves "$pkgdir"/usr/bin/LabCurves
  install -D -m755 "mm extern LabCurves.py" "$pkgdir"/usr/lib/gimp/2.0/plug-ins/LabCurves.py
}

# vim:set ts=2 sw=2 et:
