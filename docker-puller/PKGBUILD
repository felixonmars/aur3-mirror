# Maintainer: Nicholas Coughlin <nicocoffo@gmail.com>
pkgname="docker-puller"
pkgver="r16.d9ebcc4"
pkgrel=1
pkgdesc="Listens for web hooks from docker builds and runs a command."
arch=(any)
url="https://github.com/nicocoffo/docker-puller"
license=('MIT')
depends=("python2" "python2-flask" "python2-requests")
source=("git://github.com/nicocoffo/docker-puller.git"
        "docker-puller.sh"
        "docker-puller.service"
        "docker-puller.confd")
md5sums=('SKIP'
         '1b0850beaffa07cb7893097a9cac9c4e'
         'becdd1648cd63ffde8bce56bc4f5cf19'
         '50c9ed4787bfb65505edaf20316442b3')
package(){
    cd "$srcdir"

    install -d -m 755 "${pkgdir}/usr/lib/docker-puller"
    cp -dpr --no-preserve=ownership "${srcdir}/docker-puller/dockerpuller/"* "${pkgdir}/usr/lib/docker-puller"

    install -D -m 755 "${srcdir}/docker-puller.sh" "${pkgdir}/usr/bin/docker-puller"

    install -D -m 644 "${srcdir}/docker-puller.service" "${pkgdir}/usr/lib/systemd/system/docker-puller.service"

    install -D -m 644 "${srcdir}/docker-puller.confd" "${pkgdir}/etc/conf.d/docker-puller"
}
