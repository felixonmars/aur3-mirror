# Maintainer: Gen2ly <toddrpartridge@gmail.com>

pkgname=kdedecor-aurorae-cupertino
pkgver=4.3.3
pkgrel=1
pkgdesc="Various Cupertino window decorations for the Aurorae Theme Engine"
arch=('i686' 'x86_64')
url="http://kde-look.org"
license=('GPL3')
depends=('kdebase-workspace>=4.2.91' 'kdedecor-aurorae')
source=('http://kde-look.org/CONTENT/content-files/109660-cupertino-ish.tar.gz'
				'http://kde-look.org/CONTENT/content-files/109661-cupertino-air.tar.gz'
				'http://kde-look.org/CONTENT/content-files/108252-cupertino.tar.gz'
				'http://kde-look.org/CONTENT/content-files/108333-glowglass-cupertino.tar.gz')
md5sums=('38d283638a03f6ebe2d53b8d8ac0c958'
         'b56088935c43a8d23f251c3881caed8e'
         'b798d99d7d857c67699c27b9ec6d4bd1'
         '8c120b5a90d5e6746a1a3f088490c6a7')


build() {

  # Create destination directories
  install -d ${pkgdir}/usr/share/apps/aurorae/themes

	# Extract files
	tar xf 108252-cupertino.tar.gz
	tar xf 108333-glowglass-cupertino.tar.gz
	tar xf 109660-cupertino-ish.tar.gz
	tar xf 109661-cupertino-air.tar.gz

  # Install files
	cp -r cupertino cupertino-air cupertino-ish glowglass-cupertino \
	${pkgdir}/usr/share/apps/aurorae/themes

}