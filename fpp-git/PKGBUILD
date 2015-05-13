# Maintainer: Lucas Sampaio <lucas@lsmagalhaes.com>

_pkgname=fpp
pkgname=${_pkgname}-git
pkgver=0.5.6r176
pkgrel=1
pkgdesc='Facebook PathPicker is a simple command line tool that solves the perpetual problem of selecting files out of bash output.'
url='https://github.com/facebook/PathPicker'
license=('BSD')
source=('git+https://github.com/facebook/PathPicker.git')
sha256sums=('SKIP')
arch=('any')
makedepends=('git' 'python2')
conflicts=('fpp')
provides=('fpp')

pkgver() {
  cd "${srcdir}/PathPicker"
  printf "%sr%s" "$(git describe --abbrev=0 --tags)" "$(git rev-list --count HEAD)"
}

package() {
  mkdir -p $pkgdir/opt/PathPicker
  mv $srcdir/PathPicker $pkgdir/opt

  mkdir -p $pkgdir/usr/bin
  ln -s "/opt/PathPicker/fpp" "$pkgdir/usr/bin/fpp"
}
