# Maintainer: Simone Sclavi 'Ito' darkhado@gmail.com

pkgname=jag-themes
pkgver=0.3.1
pkgrel=3
pkgdesc="Additional graphic themes for jag"
arch=('any')
url="http://jag.xlabsoft.com/themes.php"
depends=('jag=0.3.1')
license=('GPL3')
source=(http://jag.xlabsoft.com/files/jag_kde_crystal.zip
        http://jag.xlabsoft.com/files/jag_african.zip
        http://jag.xlabsoft.com/files/jag_animals.zip
        http://jag.xlabsoft.com/files/jag_chinese.zip
        http://jag.xlabsoft.com/files/jag_kde_nuvola.zip
        http://jag.xlabsoft.com/files/jag_creatures.zip
        http://jag.xlabsoft.com/files/jag_futurama.zip
        http://jag.xlabsoft.com/files/jag_toys.zip)
md5sums=('1a45ba6a75ef33b896cbb8b964abc22f'
         'e64109dd1a1f91228b1b85be2cb36528'
         'dbead83c850467dae1b322e68e6ec2c2'
         '3c0c0ff1ba4f9dac1748ac33a172001c'
         'ddbdcedc3c2bc840c9f9cad5381ca40d'
         '36e67992ae836d1cb01f5e9f3291e859'
         '078916bc2b7c3ec0ae58a9e489ba3a45'
         '703c6541f072d44840bed2bb10f63117') 
package() {
    mkdir -p $pkgdir/usr/share/jag/data/schemes
    cp -a */ $pkgdir/usr/share/jag/data/schemes 
}
