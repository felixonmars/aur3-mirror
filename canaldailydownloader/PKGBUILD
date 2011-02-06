# For ArchLinux by Joël Porquet

pkgname=canaldailydownloader
pkgver=0.1.2
pkgrel=2
pkgdesc="Automatic download of Canal Plus VOD (Zapping, Action Discrete, Boite a questions, Guignols, Petit Journal, Meteo, Groland, SAV, etc.)"
url="http://renaudguezennec.homelinux.org/programmation,1-6.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python' 'flvstreamer' 'sed')
source=("http://renaudguezennec.homelinux.org/prog/Projet/CanalDailyDownloader/src/CanalDailyDownloader_${pkgver}.tar.gz")

build() {
    cd ${srcdir}/CanalDailyDownloader

    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/doc/canaldailydownloader
    mkdir -p $pkgdir/usr/share/licenses/canaldailydownloader

    # fix python path
    sed -i '1s/.*/#!\/usr\/bin\/python/g' canal.py
    install canal.py $pkgdir/usr/bin/canaldailydownloader

    install -m 644 AUTHORS $pkgdir/usr/share/doc/canaldailydownloader/
    install -m 644 COPYRIGHT $pkgdir/usr/share/doc/canaldailydownloader/
    install -m 644 COPYING.txt $pkgdir/usr/share/licenses/canaldailydownloader/

}

md5sums=('5b64df7b08a0c77c9d9e7b606c839a53')
