# Contributor: ShadowKyogre <shadowkyogre@gmail.com>

pkgname=stardict-moby-thesaurus
pkgver=2.4.2
pkgrel=1
pkgdesc="Moby Thesaurus for StarDict"
arch=('i686' 'x86_64')
depends=('stardict')
url="http://stardict.sourceforge.net"
license=('GPL')
md5sums=('6a0bbdf10569fb86130eb202f57b27a4')
source=(http://dl.sf.net/sourceforge/stardict/stardict-dictd-moby-thesaurus-$pkgver.tar.bz2)

build() {
	cd $startdir/src/stardict-dictd-moby-thesaurus-$pkgver
	mkdir -p $startdir/pkg/usr/share/stardict/dic/moby-thesaurus/
	install -m 644 dictd_www.dict.org_moby-thesaurus.ifo \
	               dictd_www.dict.org_moby-thesaurus.idx \
	               dictd_www.dict.org_moby-thesaurus.dict.dz \
	               $startdir/pkg/usr/share/stardict/dic/moby-thesaurus/
}
