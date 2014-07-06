# Maintainer: Lorenzo Iacovone <lorenzo (at) coccovax (dot) org>

pkgname=virt-top
pkgver=1.0.8
pkgrel=1
license=('GPL')
arch=('i686' 'x86_64')
pkgdesc="Top for libvirt virtual machines"
url="http://people.redhat.com/~rjones/virt-top/"
depends=('libvirt')
makedepends=('ocaml'
             'ocaml-findlib'
             'ocaml-extlib'
             'ocaml-curses'
             'ocaml-libvirt'
             'ocaml-fileutils'
             'ocaml-camomile'
             'ocaml-calendar'
             'gettext'
             'perl'
             'gawk')
source=("http://people.redhat.com/~rjones/virt-top/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7c849fe949772edb6792d50be65d8c0900cf3039708bbc7fa511bed184d32112')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./configure --libdir=/usr/lib  --prefix=/usr
  make all opt
  make DESTDIR=${pkgdir} install
}

