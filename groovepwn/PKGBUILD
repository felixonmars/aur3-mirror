# Contributor: Dan Serban

pkgname=groovepwn
pkgver=0.1
pkgrel=1
pkgdesc="A minimal proxy server for Grooveshark which will remove ads, grab MP3s and store them in your /tmp directory while you use the site as-per-usual"
arch=(any)
url="https://github.com/mossblaser/groovePwn"
license=(GPLv3)
depends=(pyid3lib)
source=(grooveMod.py mp3Handler.py proxy.py groovepwn.sh)
md5sums=('5e1981a19cc81a1df6ee3cecdbe1d71c'
         'ceb0bf4aa186a78c3001c4fc4aa81b95'
         '0c3cae5bbd7a1712ddbf0db4eb15356c'
         'b22971d92a16f3478b71dc9eef26e6ca')

build()
{
  cd $srcdir
  install -Dm755 groovepwn.sh $pkgdir/usr/bin/groovepwn
  install -Dm755 proxy.py $pkgdir/usr/share/groovepwn/proxy.py
  install -Dm644 grooveMod.py $pkgdir/usr/share/groovepwn/grooveMod.py
  install -Dm644 mp3Handler.py $pkgdir/usr/share/groovepwn/mp3Handler.py
}
