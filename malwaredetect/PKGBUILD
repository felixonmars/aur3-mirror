# Contributor: Dan Serban

pkgname=malwaredetect
pkgver=0.1
pkgrel=1
pkgdesc="Submits a file's SHA1 sum to VirusTotal to determine whether it is a known piece of malware"
arch=(any)
url=http://www.virustotal.com/
license=(GPLv3)
depends=(curl sed zenity)
source=(malwaredetect.sh)
md5sums=('f8876d2ea99ab34b9cfafda9767f4e31')

build()
{
  install -Dm755 malwaredetect.sh "${pkgdir}"/usr/bin/malwaredetect
}

