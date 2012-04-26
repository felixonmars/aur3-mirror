# Contributor: phils3r <p.seiler@linuxmail.org>
# Contributor: Michi <michael.eckert@linuxmail.org>
pkgname=bid-for-power
pkgver=1.2
pkgrel=7
pkgdesc="Dragonball Z mod for ioquake3"
arch=('any')
url="http://www.moddb.com/mods/bid-for-power"
license=('Freeware')
makedepends=('unzip')
depends=('ioquake3')
source=('http://schrobsdorf.de/download/2008_04_15_bidforpower1-2.zip' \
        'http://schrobsdorf.de/download/2008_04_15_ro-bfpdbz_pack1.zip' \
        'bid-for-power' \
	'bid-for-power.png' \
	'bid-for-power.desktop')
md5sums=('6c2dd20d5059d0d08b66785b68d94883'
         '3bbb3b07dd056571201cd589a5a24396'
         '938acb0d62f352db4f3ced30a8b3f638'
	 'db9408380a99d218f32a51379775f50e'
	 '98b6c12c2873c4802629108a9ce6e07f')


package ()
{
  mkdir -p "${pkgdir}"/opt/quake3/
  mkdir -p "${pkgdir}"/usr/bin/
  mkdir -p "${pkgdir}"/usr/share/applications/
  mkdir -p "${pkgdir}"/usr/share/pixmaps/
  unzip -q "${srcdir}"/2008_04_15_bidforpower1-2.zip -d "${pkgdir}"/opt/quake3
  unzip -q "${srcdir}"/2008_04_15_ro-bfpdbz_pack1.zip -d "${pkgdir}"/opt/quake3/bfpq3/
  install -D -m 755 "${srcdir}"/bid-for-power "${pkgdir}"/usr/bin
  install -D -m 644 "${srcdir}"/bid-for-power.png "${pkgdir}"/usr/share/pixmaps
  install -D -m 644 "${srcdir}"/bid-for-power.desktop "${pkgdir}"/usr/share/applications
}

# vim:set ts=2 sw=2 et:

