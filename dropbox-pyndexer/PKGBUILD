# Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>	
# Contributor: Kwpolska <kwpolska@kwpolska.tk>
# Contributor: marlock <?>
pkgname=dropbox-pyndexer
pkgver=1.2.4
pkgrel=4
pkgdesc="HTML index generator for Dropbox public folders"
arch=('any')
url="http://dl.dropbox.com/u/552/pyndexer/1.2/index.html"
license=('SimPL2')
depends=('python2' 'dropbox')
optdepends=('python-m2crypto: encryption support')
conflicts=('dropbox-pyndexer-git')
backup=('usr/share/pyndexer/pyndexer.ini')
source=('http://dl.dropbox.com/u/552/pyndexer/1.2/pyndexer.py'
	'http://dl.dropbox.com/u/552/dbconfig/dbconfig.py'
	'http://dl.dropbox.com/u/552/pyndexer/1.2/pyndexer.ini'
	'http://dl.dropbox.com/u/552/pyndexer/1.2/pyndexer.template.html'
	'pyndexer-dropbox-v2.patch')

md5sums=('c0e25d214ffd3d45e6df8d8857988505'
         '4bd8d0ab1d730f80f1f742672382e03b'
         'cf58a612524c219801600a2f271b131f'
         '5b27897bd78bb002ca6e3b396b2e63e5'
         '44bbba578a15b92e3fab2d3c7602c552')

package() {
  patch -Np0 --follow-symlinks -i ../pyndexer-dropbox-v2.patch	
  #unset publicfolder
  sed -i '/^publicfolder/ s/^/;/' pyndexer.ini

  mkdir -p $pkgdir{/usr/share/pyndexer,/etc}
  install -m644 pyndexer.{ini,template.html} $pkgdir/usr/share/pyndexer
  install -m755 pyndexer.py $pkgdir/usr/share/pyndexer
  install -m755 dbconfig.py $pkgdir/usr/share/pyndexer
  cat > pyndexer << EOF
#!/bin/bash
python2 /usr/share/pyndexer/pyndexer.py "\$@"
EOF
  install -D -m 755 pyndexer $pkgdir/usr/bin/pyndexer
  ln -s /usr/share/pyndexer/pyndexer.ini $pkgdir/etc/pyndexer.conf
}
