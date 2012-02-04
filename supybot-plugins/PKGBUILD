# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=supybot-plugins
pkgver=20060723
pkgrel=1
pkgdesc="Comprehensive plugin pack for Supybot"
url="http://supybot.com"
depends=('supybot')
source=(http://dl.sourceforge.net/sourceforge/supybot/Supybot-plugins-$pkgver.tar.bz2)
md5sums=('577d18ed978a6ade18537e96cd1c7e38')

build()
{
    cd $startdir/src/Supybot-plugins-$pkgver/
    
    pyver=`python -V 2>&1 | cut -d\  -f2`
    dir=$startdir/pkg/usr/lib/python${pyver%.*}/site-packages/supybot/plugins/

    mkdir -p $dir
    cp -R * $dir
}
