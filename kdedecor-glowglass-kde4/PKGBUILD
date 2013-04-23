# Maintainer: jpapadopoulos pan do t papadopoulos @ad gmail do t com


pkgname=kdedecor-glowglass-kde4
pkgver=0.2
pkgrel=1
arch=(i686 x86_64)
pkgdesc="Glowglass decoration theme for KDE4.x"
url="http://kde-look.org/content/show.php?content=107473"
license=('GPL')
source=(http://kde-look.org/CONTENT/content-files/107473-glowglass-deco02.tar.gz)
md5sums=('b926dc1ffdba608175f0657e79448873')

build() {
  # Create destination directories
  install -d ${pkgdir}/usr/share/apps/aurorae/themes

	# Extract files
	tar xf 107473-glowglass-deco02.tar.gz
	
	# Install files
	cp -r glowglass-deco \
	${pkgdir}/usr/share/apps/aurorae/themes
}
