# Contributor: Aivis Poiss <ap1821@gmail.com>
pkgname=xfwm4-theme-w8-mono
pkgver=1
pkgrel=0
pkgdesc="Windows 8 like 3-button monochrome theme for the xfce4 wm. Based on the great axiom and boje themes."
arch=("i686 x86_64")
url="https://dl.dropbox.com/u/16222427/ARCH/src.png"
license=('GPL')
depends=("xfce-theme-greybird-git")
source=(https://dl.dropbox.com/u/16222427/ARCH/w8.tar.bz2)
md5sums=('1a2a2be12ae8558828257238f022e267')

build() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}"/usr/share/themes
  for theme in $(find . -mindepth 1 -maxdepth 1 -type d); do cp -a $theme "${pkgdir}"/usr/share/themes;done
}

# vim:set ts=2 sw=2 et:
