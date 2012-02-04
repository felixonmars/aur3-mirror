# Maintainer: xduugu
pkgname=srcman
pkgver=0.4.1
pkgrel=1
pkgdesc="A pacman wrapper that transparently handles source packages"
arch=('any')
url="http://bbs.archlinux.org/viewtopic.php?id=65501"
license=('GPL')
depends=('bash>=4.0.0' 'coreutils' 'curl' 'findutils' 'grep' 'pacman>=3.4' 'sed')
backup=("etc/xdg/$pkgname/$pkgname.conf")
changelog=$pkgname.changelog
source=($pkgname-$pkgver.tar.xz
        makepkg
        makepkg-asroot.patch)
md5sums=('e43dec71eb8dd5c0dbc3407a7362078a'
         '1ecbe5ddd7942c2a846936c6d340b15f'
         'e010311c9883653ea286eac761bf4f9f')
sha256sums=('d94531749fae00c62eaf47369a246bb57b86782ee30f535ac019912a79a80435'
            'a62bdfe2281c1783082dfe61354258e0b1858a13733237d4cd542788a19cf001'
            'f0fd0060b45ae9b0d2d127eff06e80b4fd1285f96651c1bcdfe993c73a216af1')

#package() {
build() {
  cd "$pkgname-$pkgver"
  mv "$srcdir/makepkg" .
  patch -Np1 < "$srcdir/makepkg-asroot.patch"
  make DESTDIR="$pkgdir" install install-docs
  install -Dm755 makepkg "$pkgdir/usr/share/srcman/makepkg"
}

# vim:set ts=2 sw=2 et:
