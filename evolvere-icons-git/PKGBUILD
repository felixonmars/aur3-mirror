# Maintainer: Gustavo Castro <gustawho[at]gmail[dot]com>

pkgname=evolvere-icons-git
pkgver=0.r201.4f9f1e6
pkgrel=1
pkgdesc=('A smooth icon theme for KDE - All variants')
license=('CC BY-SA 4.0')
arch=('any')
url="https://github.com/franksouza183/EvolvereSuit"
makedepends=('git')
groups=('evolvere')
provides=('evolvere-icon-theme')
conflicts=('evolvere-icon-theme')
source=('evolvere::git+https://github.com/franksouza183/EvolvereSuit.git')
md5sums=('SKIP')
install=${pkgname}.install

pkgver() {
  cd "$srcdir/evolvere"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/evolvere/icons"
  install -d -m755 "$pkgdir"/usr/share/icons/
  rm -rf {.git,.gitignore,LICENSE,README.md,changelog}
  cp -r . "$pkgdir"/usr/share/icons/

  find ${pkgdir}/usr -type f -exec chmod 644 {} \;
  find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}
