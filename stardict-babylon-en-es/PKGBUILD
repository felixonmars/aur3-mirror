# Submitter : Filippo Squillace <feel.squally {AT} gmail.com >

pkgname=stardict-babylon-en-es
pkgver=2.4.2
pkgrel=3
pkgdesc="English Spanish dictionary for Stardict"
license=('freeware')
url="http://stardict.sourceforge.net"

source=("http://mirror.transact.net.au/sourceforge/s/project/st/stardictdata/English/stardict-babylon-Babylon_English_Spanish-2.4.2.tar.bz2")
md5sums=('48415c14743da73eaa4b2e4c14287d24')
arch=('any')
build() {
	cd $srcdir/stardict-babylon-Babylon_English_Spanish-$pkgver
	mkdir -p $pkgdir/usr/share/stardict/dic/
	install -m 644 Babylon_English_Spanish.dict.dz Babylon_English_Spanish.idx \
        Babylon_English_Spanish.ifo Babylon_English_Spanish.syn \
        $pkgdir/usr/share/stardict/dic/
}

