# Authors:
# Chinise: Chen Zhang, Calvin Ngei	 fockez [at] live (dot) com
# Czech: Pavel Fric	 	http://www.fripohled.blogspot.com
# French: Rémy Claverie & Jean-Baptiste Butet
# German: Tobias Burnus & Markus Bongard & Daniel Klaer & Tilman Höner zu Siederdissen & Michael Roemer & Wolfgang Kilian & Daniel Schury
# Greek: Manolis Stefanis	mstefanis [at] hotmail (dot) com
# Italian: Renato Rivoira
# Japanese: Tomomasa Ohkubo
# Portuguese: Fellype
# Romanian: Ion Vasilief
# Russian: Mikhail Shevyakov & Vasiliy Astanin & Max Brazhnikov 	makc@issp.ac.ru
# Spanish: Jose Antonio Lorenzo Fernandez
# Swedish: Peter Landgren
# Maintainer: Konstantin  A. Kovalenko <k (dot) a (dot) kovalenko [at] gmail (dot) com>
pkgname=qtiplot-translations
pkgver=0.9.8.9
pkgrel=1
epoch=
pkgdesc="Translations for Qtiplot (Chinise, Czech, French, German, Greek, Italian, Japanese, Portuguese, Romanian, Russian, Spanish, Swedish)"
arch=('any')
url="http://soft.proindependent.com/translations.html"
license=('unknown')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('qtiplot-ru')
replaces=()
backup=()
options=()
install=
changelog=
source=('http://soft.proindependent.com/translations/qtiplot_cn.qm' 'http://soft.proindependent.com/translations/qtiplot_cz.qm' 'http://soft.proindependent.com/translations/qtiplot_fr.qm' 'http://soft.proindependent.com/translations/qtiplot_de.qm' 'http://soft.proindependent.com/translations/qtiplot_el.qm' 'http://soft.proindependent.com/translations/qtiplot_it.qm' 'http://soft.proindependent.com/translations/qtiplot_ja.qm' 'http://soft.proindependent.com/translations/qtiplot_pt.qm' 'http://soft.proindependent.com/translations/qtiplot_ro.qm' 'http://soft.proindependent.com/translations/qtiplot_ru.qm' 'http://soft.proindependent.com/translations/qtiplot_es.qm' 'http://soft.proindependent.com/translations/qtiplot_sv.qm')
noextract=()
md5sums=('2e96cfc54b5b327056d42c493ed38ccd' '46f7cd3c1a44db6358f4d7d6a26c4f96' '06555c13b79ce2595c65e71edaed0f5b' 'ddf509c462b36c20bb66e8e2eaaeedf7' 'f9871413df2721e943cd26a04dfe463f' '8d31057f56f65312785689d4f084f729' 'c9d08fe8dac0f6027d9522cfd331a284' '5bd300f7603278f07f1f0e7f15d6f6a5' 'ec79579c9160b788976e19eea79c5cd2' '64c3b0a3a3c8e3075b5f7bc388e1bcbc' '5f5627793aa97bcf54910d076e9c86f6' '7b7baf57174a11faba7d2ad46d8b85ff')
build() {
#   cd "$srcdir/$pkgname-$pkgver" 
  install -d -m755 "$pkgdir/usr/share/qtiplot/translations"
  install -m644 $srcdir/* $pkgdir/usr/share/qtiplot/translations
}