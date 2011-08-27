# Maintainer: Hervé Cauwelier <herve ¤ itaapy.com>
# Published at http://aur.archlinux.org/packages.php?ID=34298

pkgname=lpod-docs-pdf
pkgver=0.9.1
pkgrel=1
pkgdesc="Languages & Platforms OpenDocument: PDF Documentation"
arch=('any')
license=('GPL3' 'APACHE2')
url="http://www.lpod-project.org/"
depends=('python-lxml')
source=("http://download.lpod-project.org/lpod-docs/lpod-docs-$pkgver.tgz")
md5sums=('3719b077e8e878bbbcdc2ec9a86c47aa')

build() {
  cd "${srcdir}/lpod-docs-${pkgver}"
  target="${pkgdir}/usr/share/doc/lpod/"
  install -d "$target"
  install -m 0644 _downloads/lpod.pdf "$target" || return 1
}
