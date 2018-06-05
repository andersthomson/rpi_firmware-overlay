#Copyright Anders Thomson
EAPI=6

DESCRIPTION="Raspberry Pi kernel, modules and GPU firmware binaries"
SRC_URI="https://github.com/raspberrypi/firmware/archive/ab802d365130f21f6897c7e1bc2f432d87803337.zip -> ${P}.zip"

LICENSE="unknown"
SLOT="${PV%.*}"
KEYWORDS=""
S="${WORKDIR}/firmware-ab802d365130f21f6897c7e1bc2f432d87803337"

src_install() {
        mkdir -p "${ED}/lib/modules/"
        cp -r ${S}/modules/* "${ED}/lib/modules/"
        tar cvfz "${ED}/lib/modules/boot-${PV}.tar.gz" "${S}/boot/"*
}

