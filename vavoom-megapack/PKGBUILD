# Maintainer: baobab?heresiarch.info

pkgname=vavoom-megapack
pkgver=2012.09.04
pkgrel=1
pkgdesc="Complete 3d models, hi-res textures and enhanced soundtrack package for Vavoom engine"
arch=('any')
url="http://sourceforge.net/projects/vavoom/"
license=('GPL')
depends=('vavoom')
source=(http://downloads.sourceforge.net/project/vavoom/Resources/vmodels-doom/1.4.3/vmodels-doom-1.4.3.zip
		http://downloads.sourceforge.net/project/vavoom/Resources/vmodels-heretic/1.4.3/vmodels-heretic-1.4.3.zip
		http://downloads.sourceforge.net/project/vavoom/Resources/vmodels-hexen/1.4.3/vmodels-hexen-1.4.3.zip
		http://downloads.sourceforge.net/project/vavoom/Resources/vmodels-strife/1.4.3/vmodels-strife-1.4.3.zip
		http://downloads.sourceforge.net/project/vavoom/Resources/vtextures/1.0/vtextures-heretic-1.0.zip
		http://downloads.sourceforge.net/project/vavoom/Resources/vtextures/1.0/vtextures-hexen-1.0.zip
		http://downloads.sourceforge.net/project/vavoom/Resources/vtextures/1.0/vtextures-strife-1.0.zip
		http://downloads.sourceforge.net/project/vavoom/Resources/vmusic/1.0/vmusic-doom1-1.0.zip
		http://downloads.sourceforge.net/project/vavoom/Resources/vmusic/1.0/vmusic-doom2-1.0.zip
		http://downloads.sourceforge.net/project/vavoom/Resources/vmusic/1.0/vmusic-tnt-1.0.zip
		http://downloads.sourceforge.net/project/vavoom/Resources/vmusic/1.0/vmusic-plutonia-1.0.zip
		http://downloads.sourceforge.net/project/vavoom/Resources/vmusic/1.0/vmusic-heretic-1.0.zip
		http://downloads.sourceforge.net/project/vavoom/Resources/vmusic/1.0/vmusic-hexen-1.0.zip
		http://doomfr.free.fr/Vavoom/vv-dhtp-20100114.zip)
md5sums=('6f977e155fe5465924bda6aa442a2a49'
         '4d9d6badc9f56399513489bc4daac35f'
         '05d59df1a1d6bd00db5327ea3ad72c90'
         '99cee3ff92bb97e47bffd497a784f535'
         'dba7993165285423fc62beb205652b31'
         'c6e63ca7033f86880b045ab0ad4904eb'
         'a7d9e49d8fd0a9c633f960a014cb61ca'
         '4a894a20b76f78baa5dfccc092566360'
         'c7e5bdb55ce706d701c8f9737efa3536'
         '6c9af571a324d4d9b7b22b856fdc4362'
         '9bf0fb29bc62552b357d75f1f6cfe03a'
         '18a7ea5ab95771be63f53ae470fe7f6c'
         '6b65b87ac849d0ea9950d2ebf5a6566b'
         '27432b013c3391cdc370554652bedd93')

build() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/vavoom
  mv basev $pkgdir/usr/share/vavoom
}
