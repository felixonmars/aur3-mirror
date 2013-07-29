# Maintainer: megadriver <megadriver at gmx dot com>
# Contributor: Firmicus <firmicus āt gmx dōt net>
# Contributor:  erm67

pkgname=timidity-eawpatches
pkgver=12
pkgrel=8
pkgdesc="Eric Welsh's GUS patches for TiMidity"
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?id=4905"
license=('custom')
depends=('timidity++')
conflicts=('timidity-instruments')
install=$pkgname.install
source=(ftp://ftp.snt.utwente.nl/pub/os/linux/gentoo/distfiles/eawpats12_full.tar.gz copyright.txt)
md5sums=('8ebcf0583f3077346ebace93c8ea166f'
         'd12c4e8962308f88c1ebb6da6503e58e')

package() {
   cd $srcdir
   install -d $pkgdir/usr/share/timidity/eawpats
   install -m644 eawpats/*.pat $pkgdir/usr/share/timidity/eawpats
   for i in ethnic gsdrum08 gsdrum25 gsdrum40 gus mazpat/fx power sfx wime ; do
	   install -d $pkgdir/usr/share/timidity/eawpats/$i
	   install -m644 eawpats/$i/*.pat $pkgdir/usr/share/timidity/eawpats/$i/
   done
   install -m644 eawpats/*.cfg $pkgdir/usr/share/timidity/eawpats/
   mkdir -p $pkgdir/etc/timidity++/eawpats
   echo "dir /usr/share/timidity/eawpats/" >timidity-eawpats.cfg
   echo "source /etc/timidity++/eawpats/eawpats.cfg" >>timidity-eawpats.cfg
   configs=(gravis.cfg gsdrums.cfg gssfx.cfg xgmap2.cfg)
   [[ -f eawpats.cfg ]] && rm eawpats.cfg
   for cfg in ${configs[@]}; do
        echo "source $cfg" >>eawpats.cfg
   done
   install -m644 timidity-eawpats.cfg $pkgdir/etc/timidity++/timidity-eawpats.cfg
   install -m644 eawpats.cfg $pkgdir/etc/timidity++/eawpats/eawpats.cfg
   install -d $pkgdir/usr/share/licenses/$pkgname
   install -m644 $srcdir/copyright.txt $pkgdir/usr/share/licenses/$pkgname/
}
