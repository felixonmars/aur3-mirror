# Maintainier Miguel Aguilar <zodiac_es@yahoo.es> 

pkgname=kdeartwork-wallpapers-steampunk
pkgver=1.0
pkgrel=4
pkgdesc="SteampunK wallpapers. This item is a part of Steam-Powered Linux KDE theme set."
arch=('any')
url="http://kde-look.org/content/show.php?content=142139"
license=('CCPL-by-sa')
groups=(steam-powered-linux)
source=(http://sites.google.com/site/binaryinspiration/download/SPL_Wlpr_Machine.tar.gz
        http://sites.google.com/site/binaryinspiration/download/SPL_Wlpr_Engine.tar.gz
        http://sites.google.com/site/binaryinspiration/download/SPL_Wlpr_Simple.tar.gz)
md5sums=('1caed6c3f83caceb2eef33cf5e2497e3'
         'edf91dd6084d6df2cd5cddc376f9900b'
	 '2b30bc69d8a675e048219a978a2b748f')

package() {
   cd $startdir/src
   install -dm 755 $pkgdir/usr/share/wallpapers/{SteampunK_Engine,SteampunK_Machine,SteampunK_Simple}/contents/images

   install -m 644 SteampunK_Engine/metadata.desktop $pkgdir/usr/share/wallpapers/SteampunK_Engine
   install -m 644 SteampunK_Machine/metadata.desktop $pkgdir/usr/share/wallpapers/SteampunK_Machine
   install -m 644 SteampunK_Simple/metadata.desktop $pkgdir/usr/share/wallpapers/SteampunK_Simple

   install -m 644 SteampunK_Engine/contents/screenshot.png $pkgdir/usr/share/wallpapers/SteampunK_Engine/contents
   install -m 644 SteampunK_Machine/contents/screenshot.png $pkgdir/usr/share/wallpapers/SteampunK_Machine/contents
   install -m 644 SteampunK_Simple/contents/screenshot.png $pkgdir/usr/share/wallpapers/SteampunK_Simple/contents

   install -m 644 SteampunK_Engine/contents/images/* $pkgdir/usr/share/wallpapers/SteampunK_Engine/contents/images
   install -m 644 SteampunK_Machine/contents/images/* $pkgdir/usr/share/wallpapers/SteampunK_Machine/contents/images
   install -m 644 SteampunK_Simple/contents/images/* $pkgdir/usr/share/wallpapers/SteampunK_Simple/contents/images
}
