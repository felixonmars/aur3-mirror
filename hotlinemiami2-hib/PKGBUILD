# Maintainer: Yamakaky <fr dot yamaworld at yamakaky>

pkgname=hotlinemiami2-hib
_pkgver=1.01-09-03-2015
pkgver=$(echo $_pkgver | tr - _)
pkgrel=1
pkgdesc="A 2D top-down action video game"
url="http://hotlinemiami.com/"
license=('unknown')
arch=('x86_64')
groups=("games")
depends=('fmodex' 'glew1.10' 'sdl2')
source=("hib://HotlineMiami2-Linux-DRMFree-v${_pkgver}.tar.gz"
        'hotlinemiami2.desktop'
        'hotlinemiami2')
sha1sums=('fef83f27ab2c2ac8db712386fdc9b3ec02de779a'
          'da7397c45a66cd4c3f0a5d18754b44049ec00ada'
          'a985838e7bd88a26f1f12488785771c8954d0900')

# You can download the Humble Indie Bundle file manually, or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, to use hib-dlagent to download files set something like this in
# your makepkg.conf (change/add -k and add -u/-p to your needs):
# DLAGENTS=('hib::/usr/bin/hib-dlagent -k 1a2b3c -o %o $(echo %u | cut -c 7-)')
#
# To auto-search through a directory containing Humble Bundle downloads, you
# could set:
# DLAGENTS=('hib::/usr/bin/find /path/to/downloads -name $(echo %u | cut -c 7-) -exec ln -s \{\} %o \; -quit')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf."; exit 1')


package()
{
    cd ${srcdir}

    mkdir -p ${pkgdir}/{usr/bin,usr/share/applications,opt/HotlineMiami2}
    cp hotline_miami_2_linux64/{HotlineMiami2,*.txt,*.wad} ${pkgdir}/opt/HotlineMiami2/
    install -m 755 hotlinemiami2 ${pkgdir}/usr/bin/
    install -m 644 hotlinemiami2.desktop ${pkgdir}/usr/share/applications/
}
