# Maintainer: Ilya Goldberg iggie at mac dot com
pkgname=timer_q-docs
pkgver=1.0.7
pkgrel=1
pkgdesc='Documentation for timer_q, a C library to implement multiple queues of timed events.'
arch=('any')
license=('LGPL')
url='http://www.and.org/timer_q/latest/'
source=("http://www.and.org/timer_q/latest/timer_q-1.0.7.tar.gz")
md5sums=('97790cd98a0f908742ce6079b4890333')

build() {
  cd timer_q-$pkgver
  ./configure --prefix=/usr
  make SUBDIRS='Documentation'
}

package() {
  cd timer_q-$pkgver
  make SUBDIRS='Documentation' DESTDIR="$pkgdir/" install
}
