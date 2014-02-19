pkgname=fahviewer-beta
pkgver=7.4.2
pkgrel=10
pkgdesc='Viewer for Folding@Home'
url="http://folding.stanford.edu/English/HomePage"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('bzip2' 'gcc-libs-multilib')
options=('!docs' '!libtool')
_common_url='https://fah-web.stanford.edu/file-releases/beta/release/fahviewer/'

#test for architecture, pull down appropriate file
if test "$CARCH" == i686; then
  source=(${_common_url}debian-testing-32bit/v7.4/fahviewer_${pkgver}_i386.deb)
  md5sums=('fa4eb1e720d33ec52682dfae70eb3b8b')
else
  source=(${_common_url}debian-testing-64bit/v7.4/fahviewer_${pkgver}_amd64.deb)
  md5sums=('bfaf7b1f3c0b2ac10c126a8892c59ebf')
fi

DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

package() {
  cd ${srcdir}
  tar -xf data.tar.gz

  cd ${srcdir}
  install -D -m0755 ${srcdir}/usr/bin/FAHViewer ${pkgdir}/usr/bin/FAHViewer
  install -D -m0644 ${srcdir}/usr/share/pixmaps/FAHViewer*.png ${pkgdir}/usr/share/pixmaps/FAHViewer.png
  install -D -m0644 ${srcdir}/usr/share/applications/FAHViewer.desktop ${pkgdir}/usr/share/applications/FAHViewer.desktop
}
