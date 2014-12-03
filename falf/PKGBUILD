# Maintainer: 
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: nobange <nobange@poczta.onet.pl>

pkgname=falf
pkgver=1.3
pkgrel=1
pkgdesc="Music player for KDE (based on Xine)"
arch=('i686' 'x86_64')
url="http://falf.sourceforge.net/"
license=('GPL')
depends=('kdelibs3' 'taglib' 'qt3' 'xine-lib')
makedepends=('patch')
source=(http://sourceforge.net/projects/falf/files/FALF%20Player%20stable/$pkgver/$pkgname-$pkgver.tar.bz2
        $pkgname-build.patch)
md5sums=('d26042a930c6a166630591abbeffe6fb'
         'c8a715550b14277db8d2bee326f8b5c5')

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -d "${pkgdir}"/opt/kde/bin \
    "${pkgdir}"/opt/kde/share/locale/{cs,es,it,nl,pl,ru,uk,zh_CN}/LC_MESSAGES/ \
    "${pkgdir}"/opt/kde/share/{applnk/Multimedia,apps/konqueror/servicemenus,icons/default.kde}

  patch -Np0 -i "${srcdir}"/$pkgname-build.patch
  sh install.sh

# correcting file permissions
  find "${pkgdir}"/opt/kde/share -type f -exec chmod 644 "{}" \;
} 
