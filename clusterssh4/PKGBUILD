# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=clusterssh4
pkgver=4.02_04
pkgrel=1
pkgdesc="A tool for making the same change on multiple servers at the same time"
arch=('any')
url="http://clusterssh.sourceforge.net/"
license=('GPL')
depends=('perl' 'perl-tk' 'perl-x11-protocol' 'perl-exception-class' 'perl-try-tiny')
makedepends=( 'perl-test-trap' 'perl-file-which' 'perl-test-differences' 'perl-test-pod-coverage' 'perl-test-pod' 'perl-test-manifest' 'perl-test-distmanifest')
optdepends=('xterm: terminal application')
#changelog=$pkgname.changelog
source=(http://sourceforge.net/projects/clusterssh/files/2.%20ClusterSSH%20Series%204/App-ClusterSSH-$pkgver.tar.gz)
sha256sums=('a16142261ca83bee871005f9293f4f54da8c24918a6b439cee1f774ed4f0eb5a')

build() {
  cd ${srcdir}/App-ClusterSSH-$pkgver

  perl Build.PL installdirs=vendor
  ./Build
}

package() {
  cd ${srcdir}/App-ClusterSSH-$pkgver

  ./Build install --destdir=$pkgdir
}
