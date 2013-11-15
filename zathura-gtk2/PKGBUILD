# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: ML <neldoreth>

pkgname=zathura-gtk2
pkgver=0.2.5
pkgrel=1
pkgdesc='Highly customizable and functional document viewer (GTK2)'
arch=('i686' 'x86_64')
url='http://pwmt.org/projects/zathura/'
license=('custom')
depends=('girara-gtk2' 'sqlite' 'desktop-file-utils' 'file')
makedepends=('python2-docutils')

optdepends=('zathura-djvu: DjVu support'
            'zathura-pdf-poppler: PDF support' 
            'zathura-pdf-mupdf: PDF support' 
            'zathura-ps: PostScript support'
            'zathura-cb: comic book support')

provides=('zathura')
conflicts=('zathura')
install=zathura.install
source=("http://pwmt.org/projects/zathura/download/zathura-$pkgver.tar.gz"
	bash-completion)
md5sums=('a16bd5a892423f14b2f08e0312c42d21'
         'cac20c37f0e77ba62a8138788f4ccabb')

build() {
  cd "$srcdir/zathura-$pkgver"
  sed -i 's/rst2man/&2/' config.mk
  make ZATHURA_GTK_VERSION=2
}

package() {
  cd "$srcdir/zathura-$pkgver"
  make install DESTDIR="$pkgdir" ZATHURA_GTK_VERSION=2
  install -D -m664 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 "$srcdir/bash-completion" "$pkgdir/usr/share/bash-completion/completions/zathura"
}

# vim:set ts=2 sw=2 et:
