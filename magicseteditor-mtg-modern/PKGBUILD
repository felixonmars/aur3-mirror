
pkgname=magicseteditor-mtg-modern
pkgver=20140705
pkgrel=3
pkgdesc="Magic Set Editor templates for Magic: The Gathering Modern redesign"
arch=(any)
url="http://msetemps.sourceforge.net/phpBB3/viewtopic.php?t=144"
license=('freeware')
depends=('magicseteditor-mtg-base')
conflicts=("")
source=("http://downloads.sourceforge.net/msetemps/Magic - Printed Modern Styles.mse-installer"
        "http://downloads.sourceforge.net/msetemps/Magic - Other Printed Styles.mse-installer"
        "http://downloads.sourceforge.net/msetemps/Magic - Unset Styles.mse-installer"
        "http://downloads.sourceforge.net/msetemps/Magic - Futureshifted Styles.mse-installer"
        "http://downloads.sourceforge.net/msetemps/Magic - Planeshifted Styles.mse-installer"
        "http://downloads.sourceforge.net/msetemps/Magic - Modern Clear Styles.mse-installer")
md5sums=('3c47596e24226707942d4f3f736f916c'
         '7e6dabdd7786a3f0527b3ac2c771f23c'
         '8b87e794a4035c08a959a8e30ba78d77'
         'e78adf3fd7351d633b0e96d800749456'
         'ac766d962273b5f6d6b40395d464c3a7'
         '9cb0fdb7bde98aabafb55185adc187e9')

package() {
  install -d $pkgdir/usr/share/magicseteditor/data

  cd $srcdir
  find magic-{future-common,mana-future,mana-small-grey,watermarks-counter}.* -name '*.png' -type f -exec mogrify {} \;
  cp -r magic-{future-common,mana-future,mana-small-grey,watermarks-counter}.* $pkgdir/usr/share/magicseteditor/data
  find magic-{checklist,counter,future,new,planeshifted,playtest,rulestip}* -name '*.png' -type f -exec mogrify {} \;
  cp -r magic-{checklist,counter,future,new,planeshifted,playtest,rulestip}* $pkgdir/usr/share/magicseteditor/data
  chmod 755 $pkgdir/usr/share/magicseteditor/data/*
}
