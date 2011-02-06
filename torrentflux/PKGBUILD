# 'Maintainer': Mikko Seppälä <t-r-a-y@mbnet.fi> aka Neverth

pkgname=torrentflux
pkgver=2.4
pkgrel=2
pkgdesc="TorrentFlux is a free php based Torrent client that runs on a web server. Manage all of your Torrents remotely or locally."
arch=(i686 x86_64)
url="http://www.torrentflux.com/"
license=(GPL)
# You still need your favorite httpd, I do not wish to force it.
depends=('mysql' 'php' 'python' 'pycrypto')
makedepends=('findutils')
conflicts=('torrentflux2')
backup=('opt/torrentflux/config.php')
install=(torrentflux.install)
source=("http://mesh.dl.sourceforge.net/sourceforge/torrentflux/${pkgname}_${pkgver}.tar.gz" "torrentflux.install")
md5sums=('8fdc3952bc2ece9f10bcee299b2aeb16' 'f14ebd47dd41c7949411973c2f74f4fd')

build()
{
        cd $startdir/src/${pkgname}_${pkgver}
        install -d $startdir/pkg/opt/torrentflux
	
	# This thing is compressed in windows? fix permissions later..
        cp -R html/* $startdir/pkg/opt/torrentflux/
        cp -R sql $startdir/pkg/opt/torrentflux

	cd $startdir/pkg
	# Our group
        chgrp -R daemon opt/torrentflux
        chmod -R 775 opt/torrentflux
	
	# Our mysqluser, we dont want root here :p
        sed -re 's/root/torrentfluxie/' -i opt/torrentflux/config.php
	
	cd opt/torrentflux
        # Permissions...
        find ./ -name \*php -exec chmod 444 '{}' \;
        find ./ -name \*png -exec chmod 444 '{}' \; 
        find ./ -name \*gif -exec chmod 444 '{}' \;
       # They dont want to read this
        chmod 660 config.php
        chmod 444 favicon.ico dtree.css *.js blank.html TF_BitTornado/index.html images/*{gif,png,ico,html} searchEngines/* themes/index.html downloads/index.html
        # We dont touch to adodb, leave it for customizer, as so we leave subdirs for now

        # Upgrade files
        install -D -m444 $startdir/src/${pkgname}_${pkgver}/upgrades/upgrade21_22.php $startdir/pkg/opt/torrentflux/upgradeflux21_22.php
        install -D -m444 $startdir/src/${pkgname}_${pkgver}/upgrades/upgrade22_23.php $startdir/pkg/opt/torrentflux/upgradeflux22_23.php
        install -D -m444 $startdir/src/${pkgname}_${pkgver}/upgrades/upgrade23_24.php $startdir/pkg/opt/torrentflux/upgradeflux23_24.php
}

