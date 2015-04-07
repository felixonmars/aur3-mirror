# Mantainer: Janus <janus@rtfm.org.ar>
# Upstream: Frank Souza

_pkgbasename=evolvere
_pkgvariant=dark-fallback
pkgname=$_pkgbasename-icon-theme
pkgver=1.1.9.1
pkgrel=3
pkgdesc="A smooth icon theme for your Linux workspace - Dark Fallback variant"
arch=('any')
url="http://gnome-look.org/content/show.php?content=164338"
license=('Creative Commons by-nc-nd')
source=("https://www.dropbox.com/s/zfx5reww5d5y30j/$_pkgbasename-$_pkgvariant-$pkgver-$pkgrel.zip")
         https://www.dropbox.com/s//evolvere-dark-fallback-1.1.9.1-3.zip?dl=0
sha256sums=('a4c32365c52f9accbf93f6912f6cc84c74feb0e2d15b9a474042262349b19687')

package() {
  # Create destination folder
  install -d "$pkgdir"/usr/share/icons

  # Install icon theme
  cp -r $_pkgbasename-$_pkgvariant "$pkgdir"/usr/share/icons/$_pkgbasename
  find $pkgdir/usr/share/icons/$_pkgbasename -type f -print|xargs chmod 644 # no exec bit for files
}
