# Submitter : Filippo Squillace <feel.squally {AT} gmail.com >

pkgname=stardict-babylon-es-en
pkgver=2.4.2
pkgrel=3
pkgdesc="Spanish English dictionary for Stardict"
license=('freeware')
url="http://stardict.sourceforge.net"


source=("http://mirror.transact.net.au/sourceforge/s/project/st/stardictdata/English/stardict-babylon-Babylon_Spanish_English_dictio-2.4.2.tar.bz2")
md5sums=('033db9e554529da90ce4167e4bac94e9')
arch=('any')
build() {
	cd $srcdir/stardict-babylon-Babylon_Spanish_English_dictio-$pkgver
	mkdir -p $pkgdir/usr/share/stardict/dic/
	install -m 644 Babylon_Spanish_English_dictio.dict.dz Babylon_Spanish_English_dictio.idx \
        Babylon_Spanish_English_dictio.ifo Babylon_Spanish_English_dictio.syn \
        $pkgdir/usr/share/stardict/dic/
}

