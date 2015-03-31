# Maintainer: Gustavo Castro <gustawho[at]gmail[dot]com>

pkgname=adium-theme-evolvere-git
pkgver=0.r201.4f9f1e6
pkgrel=1
pkgdesc=('Adium message style, part of the Evolvere suite.')
license=('CC BY-SA 4.0')
arch=('any')
url="https://github.com/franksouza183/EvolvereSuit"
makedepends=('git')
groups=('evolvere')
source=('evolvere::git+https://github.com/franksouza183/EvolvereSuit.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/evolvere"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/evolvere/adium-message-style/ktelepathy/Evolvere.AdiumMessageStyle"
  install -d -m755 "$pkgdir"/usr/share/apps/ktelepathy/styles/Evolvere.AdiumMessageStyle
  rm -rf {.git,.gitignore,LICENSE,README.md,changelog}
  cp -r . "$pkgdir"/usr/share/apps/ktelepathy/styles/Evolvere.AdiumMessageStyle
 
  find ${pkgdir}/usr -type f -exec chmod 644 {} \;
  find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}
