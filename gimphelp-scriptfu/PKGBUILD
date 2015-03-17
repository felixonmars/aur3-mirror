# Maintainer: Daniel Spies <ds20150201aur at pskx dot net>
# Contributor: Egon Geerardyn <egon dot geerardyn at gmail dot com>

pkgname=gimphelp-scriptfu
pkgver=41
pkgrel=1
pkgdesc="Script-FU script collection for GIMP 2.8+"
arch=('any')
url="http://www.gimphelp.org/script28.shtml"
license=('GPL')
depends=('gimp>=2.8')
source=("http://www.gimphelp.org/DL/gimp_scripts-2.8.tar.bz2")
md5sums=('4d1444fb590271ff585a14340c1b2f65')
sha256sums=('3c1071e630ff24cd1032ca83780022c720fbab72253855e786ebebc1c75c0485')

build() {
  cd ${srcdir}/gimp_scripts-2.8
  #grep -iL "gnu" *.scm | xargs grep -iL "gpl" | xargs grep -iL "pucelo" | xargs rm

}

package() {
  cd ${srcdir}/gimp_scripts-2.8

  install -d -m755 ${pkgdir}/usr/share/gimp/2.0/scripts
  install -d -m755 ${pkgdir}/usr/share/gimp/2.0/gradients
  install -d -m755 ${pkgdir}/usr/share/gimp/2.0/patterns
  install -d -m755 ${pkgdir}/usr/share/gimp/2.0/gimpressionist/Presets 

  for file in *.scm
  do
    install -m644 ${srcdir}/gimp_scripts-2.8/${file} ${pkgdir}/usr/share/gimp/2.0/scripts/
  done

  cp -drv --preserve=mode,timestamp ${srcdir}/gimp_scripts-2.8/gradients/ ${pkgdir}/usr/share/gimp/2.0/
  cp -drv --preserve=mode,timestamp ${srcdir}/gimp_scripts-2.8/patterns/ ${pkgdir}/usr/share/gimp/2.0/
  cp -drv --preserve=mode,timestamp ${srcdir}/gimp_scripts-2.8/gimpressionist/Presets/ ${pkgdir}/usr/share/gimp/2.0/gimpressionist/
}

