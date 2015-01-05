# Google-SiteMap-Generator: Installer: Arch
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>

pkgname=google-sitemap-generator
filename=sitemap_gen
pkgver=1.5
pkgrel=1
pkgdesc="A Python script that creates a Sitemap for your site using the Sitemap Protocol"
arch=('i686' 'x86_64')
url="http://code.google.com/p/sitemap-generators/"
license=('custom')
depends=('python>=2.3')
makedepends=('python>=2.3')
options=(!emptydirs)
source=(http://sitemap-generators.googlecode.com/files/${filename}_${pkgver}.tar.gz)
md5sums=('98754e802722c0cc2ffcc8aedead67b6')

package() {
	sudo ./setup.py install
}
